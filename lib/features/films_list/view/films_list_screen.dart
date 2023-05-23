import 'package:flutter/material.dart';

class FilmsListScreen extends StatefulWidget {
  const FilmsListScreen({super.key});

  @override
  State<FilmsListScreen> createState() => _FilmsListScreenState();
}

class _FilmsListScreenState extends State<FilmsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Film List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/search_film");
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/film_collection");
              },
              icon: Icon(Icons.bookmark_border_outlined))
        ],
      ),
      body: Placeholder(),
    );
  }
}
