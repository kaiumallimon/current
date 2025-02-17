import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.theme,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
  });

  final ColorScheme theme;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: theme.surface,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ),
      ),
    );
  }
}
