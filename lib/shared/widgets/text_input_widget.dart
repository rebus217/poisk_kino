import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget(
      {super.key,
      required this.name,
      this.obscureText = false,
      required this.controller});

  final String name;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: widget.name,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
