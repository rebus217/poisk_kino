import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_flutter/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:learning_flutter/features/crypto_coin/bloc/crypto_coin_details_state.dart';
import 'package:learning_flutter/features/crypto_coin/widgets/base_card.dart';
import 'package:learning_flutter/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;

  final _cryptoCoinDetailsBloc =
      CryptoCoinDetailsBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    assert(
        args != null && args is CryptoCoin, "you must provide CryptoCoin arg");

    coin = args as CryptoCoin;
    _cryptoCoinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: coin!.name));
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoCoinDetailsBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailLodaded) {
            final name = state.coin.name;
            final details = state.coin.details;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(details.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text("${details.priceInUSD} \$"),
                    ),
                  ),
                  BaseCard(
                      child: Column(
                    children: [
                      _DataRow(
                        title: 'Hight 24 Hour',
                        value: "${details.hight24Hour} \$",
                      ),
                      _DataRow(
                        title: 'Low 24 Hour',
                        value: "${details.low24Hours} \$",
                      )
                    ],
                  ))
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(title),
        ),
        const SizedBox(
          width: 32,
        ),
        Flexible(
          child: Text(value),
        )
      ],
    );
  }
}
