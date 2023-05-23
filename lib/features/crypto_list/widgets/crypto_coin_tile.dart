import 'package:flutter/material.dart';
import 'package:learning_flutter/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    required this.coin,
    super.key,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        "${coinDetails.priceInUSD} \$",
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: () {
        Navigator.of(context).pushNamed("/coin", arguments: coin);
      },
    );
  }
}
