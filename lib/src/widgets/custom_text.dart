import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final String? fontFamily;
  final double? height;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool softWrap;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.height,
    this.fontWeight,
    this.letterSpacing,
    this.wordSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap = true,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ?? const TextStyle();

    if (textColor != null) textStyle = textStyle.copyWith(color: textColor);
    if (fontSize != null) textStyle = textStyle.copyWith(fontSize: fontSize);
    if (fontFamily != null) {
      textStyle = textStyle.copyWith(fontFamily: fontFamily);
    }
    if (height != null) textStyle = textStyle.copyWith(height: height);
    if (fontWeight != null) {
      textStyle = textStyle.copyWith(fontWeight: fontWeight);
    }
    if (letterSpacing != null) {
      textStyle = textStyle.copyWith(letterSpacing: letterSpacing);
    }
    if (wordSpacing != null) {
      textStyle = textStyle.copyWith(wordSpacing: wordSpacing);
    }

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
