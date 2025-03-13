import 'package:flutter/material.dart';

extension StringExtension on String {
  String italics() {
    return this;
  }

  TextStyle get textStyleItalic => const TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.red, // warna untuk pesan error
    fontSize: 12.0, // ukuran font untuk pesan error
  );
}
