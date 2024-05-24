import 'package:flutter/material.dart';
import 'package:wallet_wizard_app/screens/theme/colors.dart';
import 'package:wallet_wizard_app/screens/theme/textstyles.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;

  const TextFieldAppWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
  });

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.Medium16(AppColors.white40),
        ),
        SizedBox(height: 7),
        TextField(
          maxLength: 35,
          style: TextStyle(color: AppColors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            counterText: "",
            hintStyle: TextStyle(
                color: AppColors.white15, fontWeight: FontWeight.w500),
            hintText: widget.hintText,
            filled: true,
            fillColor: AppColors.white10,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(32))),
          ),
        ),
      ],
    );
  }
}
