import 'package:flutter/material.dart';

Widget defaultTextField({
  required TextInputType inputType,
  required TextEditingController? controller,
  required FormFieldValidator<String> validator,
  required String label,
  String? hint,
  IconData? suffix,
  VoidCallback? suffixfunction,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onSuffixPressed,
  bool isPassword = false,
  Color labelColor = Colors.grey,
  Color hintColor = Colors.grey,
}) {
  return TextFormField(
    keyboardType: inputType,
    controller: controller,
    validator: validator,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      suffix: IconButton(onPressed: suffixfunction, icon: Icon(suffix)),
      hintStyle: TextStyle(color: hintColor),
      labelStyle: TextStyle(color: labelColor),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon),
              onPressed: onSuffixPressed,
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    ),
  );
}
