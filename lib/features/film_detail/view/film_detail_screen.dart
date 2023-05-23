import 'package:flutter/material.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen({super.key});

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Details"),
      ),
      body: const Placeholder(),
    );
  }
}
