import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget(
      {super.key, required this.name, this.obscureText = false});

  final String name;
  final bool obscureText;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: widget.obscureText,
          textAlign: TextAlign.center,
          decoration: InputDecoration(hintText: widget.name),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
