import 'package:flutter/material.dart';

class FilmCollectionScreen extends StatefulWidget {
  const FilmCollectionScreen({super.key});

  @override
  State<FilmCollectionScreen> createState() => _FilmCollectionScreenState();
}

class _FilmCollectionScreenState extends State<FilmCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collection"),
      ),
      body: const Placeholder(),
    );
  }
}
