import 'package:flutter/material.dart';
import 'package:learning_flutter/features/crypto_coin/crypto_coin.dart';
import 'package:learning_flutter/features/crypto_list/crypto_list.dart';

final Map<String, StatefulWidget Function(BuildContext context)> routes = {
  "/": (BuildContext context) => const CryptoListScreen(),
  "/coin": (BuildContext context) => const CryptoCoinScreen(),
};
