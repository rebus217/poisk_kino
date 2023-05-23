import 'package:equatable/equatable.dart';
import 'package:learning_flutter/repositories/crypto_coins/models/models.dart';

abstract class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {}

class CryptoCoinDetailLoading extends CryptoCoinDetailsState {}

class CryptoCoinDetailLodaded extends CryptoCoinDetailsState {
  const CryptoCoinDetailLodaded({required this.coin});
  final CryptoCoin coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailLoadingFailure extends CryptoCoinDetailsState {
  const CryptoCoinDetailLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
