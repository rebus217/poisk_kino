import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_flutter/features/crypto_coin/bloc/crypto_coin_details_state.dart';
import 'package:learning_flutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_details_event.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinDetailsRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoinDetails>((event, emit) async {
      try {
        final CryptoCoin cryptoCoinDetail =
            await coinDetailsRepository.getCoinDetails(event.currencyCode);
        emit(CryptoCoinDetailLodaded(coin: cryptoCoinDetail));
      } catch (e, st) {
        emit(CryptoCoinDetailLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractCoinsRepository coinDetailsRepository;
}
