import 'package:flutter/material.dart';

class ProfileElement extends StatelessWidget {
  const ProfileElement({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
  });

  final String title;
  final IconData leadingIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(title),
      onTap: onTap,
      style: ListTileStyle.list,
      tileColor: Colors.grey.shade200,
    );
  }
}
