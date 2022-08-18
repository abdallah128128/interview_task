import 'package:flutter/material.dart';


class MyTextFormField extends StatelessWidget {
  String? labelText;
  String? emptyText;
  IconData? preFix;
  IconData? suffixIcon;
  Widget? suffixWidget;
  void Function()? suffixPressed;
  String? Function(String?)? validate;
  String? hintText;
  TextEditingController? controller;
  bool isPassword;
  TextInputType type;
  Color? cursorColor;
  double endPadding;

  MyTextFormField({
    Key? key,
    this.labelText,
    this.emptyText,
    this.hintText,
    this.preFix,
    required this.controller,
    required this.type,
    this.validate,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixPressed,
    this.isPassword = false,
    this.cursorColor,
    this.endPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(
        color: Colors.grey.shade400,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcon,
          ),
        )
            : null,
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      validator: validate,
    );
  }

}
