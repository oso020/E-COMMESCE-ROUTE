import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool? isSecured;

  CustomTextFormField({
    required this.hint,
    required this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isSecured = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isSecured;

  @override
  void initState() {
    super.initState();
    _isSecured = widget.isSecured ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: getTextStyle(
        18.0,
        FontWeightManager.light,
        ColorManager.black,
      ),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: _isSecured,
      cursorColor: ColorManager.grey,
      decoration: InputDecoration(
        hintText: widget.hint,
        helperStyle: TextStyle(color: ColorManager.grey),
        fillColor: ColorManager.white,
        filled: true,
        suffixIcon: widget.isSecured == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isSecured = !_isSecured;
                  });
                },
                icon: Icon(
                  _isSecured ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.grey,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: ColorManager.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: ColorManager.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: ColorManager.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: ColorManager.error),
        ),
      ),
    );
  }
}
