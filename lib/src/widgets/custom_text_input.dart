import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? cursorColor;
  final bool hideTitle;

  const CustomTextInput({
    super.key,
    required this.placeholder,
    this.title = "",
    this.titleStyle,
    this.contentStyle,
    this.backgroundColor,
    this.textColor,
    this.controller,
    this.width,
    this.height,
    this.padding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.border,
    this.borderRadius,
    this.cursorColor,
    this.hideTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry effectivePadding =
        padding ??
        EdgeInsets.only(
          left: leftPadding ?? 12,
          right: rightPadding ?? 12,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0,
        );

    final bool shouldShowTitle = !hideTitle && title.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (shouldShowTitle) ...[
          Text(
            title,
            style:
                titleStyle ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor ?? Colors.black,
                ),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.grey.shade200,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            border: border,
          ),
          padding: effectivePadding,
          child: TextField(
            controller: controller,
            style: contentStyle ?? TextStyle(color: textColor ?? Colors.black),
            cursorColor: cursorColor ?? Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              hintStyle: TextStyle(
                color: textColor?.withAlpha(100),
                height: 4,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
