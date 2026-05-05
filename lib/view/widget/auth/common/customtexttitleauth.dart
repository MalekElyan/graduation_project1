import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;

  const CustomTextTitleAuth({super.key, required this.text, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
