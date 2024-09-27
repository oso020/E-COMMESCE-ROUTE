import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  void Function() onButtonClicked;

  CustomElevatedButton({required this.text, required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonClicked,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
        foregroundColor: WidgetStateProperty.all(ColorManager.primary),
        backgroundColor: WidgetStateProperty.all(ColorManager.white),
      ),
    );
  }
}
