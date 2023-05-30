import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({super.key, required this.onTrayAgain});

  final VoidCallback onTrayAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Something went wrong"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Try again"),
              IconButton(
                onPressed: onTrayAgain,
                icon: const Icon(
                  Icons.replay_rounded,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
