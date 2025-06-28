import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final double? width;
  final double height;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height = 40,
    this.fontSize = 15,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    Color? borderColor,
    Color? textColor,
    this.borderRadius = 8,
  }) : borderColor = borderColor ?? const Color(0xFF1976D2), // Default blue
       textColor = textColor ?? const Color(0xFF1976D2); // Default blue

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child:
            child ??
            Text(
              text ?? '',
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
      ),
    );
  }
}
