import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;

  const CustomTextBodyAuth({super.key, required this.text, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsetsDirectional.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
