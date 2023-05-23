import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_flutter/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:learning_flutter/features/crypto_list/widgets/widgets.dart';
import 'package:learning_flutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:learning_flutter/theme/theme.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  final String title = "Crypto list screen";

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int i) {
                  final CryptoCoin coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Something went wrong",
                      style: darkTheme.textTheme.bodyMedium,
                    ),
                    Text(
                      "Please try again",
                      style: darkTheme.textTheme.labelSmall
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList());
                        },
                        child: const Text("Try again")),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
