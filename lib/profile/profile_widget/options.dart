import 'package:flutter/material.dart';

class ProfileOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? labelColor;

  const ProfileOptionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor ?? Colors.black),
        ),
        Text(
          label,
          style: TextStyle(color: labelColor ?? Colors.black),
        ),
      ],
    );
  }
}
