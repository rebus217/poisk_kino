import 'package:flutter/material.dart';

class FilmPosterWidget extends StatelessWidget {
  const FilmPosterWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Image.network(
        url,
        fit: BoxFit.contain,
      ),
    );
  }
}
