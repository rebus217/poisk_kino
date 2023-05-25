import 'package:flutter/material.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({super.key, required this.description});
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Description"),
        Text(description ?? "-"),
      ],
    );
  }
}
