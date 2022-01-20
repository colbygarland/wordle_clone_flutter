import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: constant_identifier_names
const LETTER_COUNT = 5;

class LetterRow extends StatefulWidget {
  const LetterRow({Key? key}) : super(key: key);

  @override
  State<LetterRow> createState() => _LetterRowState();
}

class _LetterRowState extends State<LetterRow> {
  final focusNode = FocusNode();
  String word = '';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        for (var i = 0; i < LETTER_COUNT; i++)
          Positioned(
              left: (12 + (i * 80)).toDouble(),
              top: 5,
              child: Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.grey)),
              )),
        TextField(
          style: const TextStyle(fontSize: 50, letterSpacing: 50, fontFeatures: [FontFeature.tabularFigures()]),
          inputFormatters: [_UpperCaseTextFormatter()],
          //textAlign: TextAlign.center,
          onChanged: (value) => setState(() {
            word = value;
          }),
          maxLength: LETTER_COUNT,
          showCursor: false,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
        ),
      ],
    ));
  }
}

class _UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
