import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_applicn_5/const_file.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final double? textFieldHieht;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool obscureText;
  const CustomTextField({
    this.maxLength,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.textFieldHieht,
    this.textAlign = TextAlign.start,
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.obscureText = false,
    this.textInputAction,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        height: textFieldHieht,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textAlign: textAlign,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          validator: validator,
          textInputAction: textInputAction,
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: secondaryColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            counterText: '',
            hintText: hintText,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
