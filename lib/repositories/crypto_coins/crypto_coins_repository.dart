import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_flutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
    required this.cryptoCoinsBox,
  });

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFromAPI();

      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }
    cryptoCoinsList.sort(
      (a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD),
    );
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromAPI() async {
    final Response<dynamic> response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID&tsyms=USD");
    final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    final Map<String, dynamic> dataRow = data["RAW"] as Map<String, dynamic>;
    final List<CryptoCoin> cryptoCoinsList =
        dataRow.entries.map((MapEntry<String, dynamic> e) {
      final Map<String, dynamic> usdData =
          (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final details = CryptoCoinDetail.fromJson(usdData);

      // final String imageUrl = usdData["IMAGEURL"] as String;
      // final double price = usdData["PRICE"] as double;

      return CryptoCoin(
        name: e.key,
        details: details,
      );
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(currencyCode);
      await cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);

    return CryptoCoin(name: currencyCode, details: details);
  }
}
