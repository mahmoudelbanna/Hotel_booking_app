import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String text;
  final String value;
  final String groupValue;
  final LanguageTitleOnTap onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey.shade200,
      title: Text(text),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: (value) => onChanged(value.toString()),
      ),
    );
  }
}
