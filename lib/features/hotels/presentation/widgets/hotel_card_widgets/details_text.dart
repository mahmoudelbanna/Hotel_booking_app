import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.grey[700],
          ),
      overflow: TextOverflow.fade,
    );
  }
}
