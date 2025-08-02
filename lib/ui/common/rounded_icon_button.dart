import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: icon == Icons.remove ? Colors.red : Colors.green,
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
