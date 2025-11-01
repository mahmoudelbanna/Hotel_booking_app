import 'package:flutter/material.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key, required this.text, required this.value});

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Colors.grey.shade200,
      title: Text(text),
      trailing: Radio(value: value),
    );
  }
}
