
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 22,
        ),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      maxLines: maxLines,
      cursorColor: Colors.white,
      cursorHeight: 32.0,
    );
  }
}