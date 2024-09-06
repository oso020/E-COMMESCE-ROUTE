import 'package:flutter/material.dart';


class Textfieldcustom extends StatelessWidget {
  final String lableText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefiexIcon;

  const Textfieldcustom(
      {super.key,
      required this.lableText,
      required this.controller,
      required this.validator,
       this.prefiexIcon
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(

        style: Theme.of(context).textTheme.bodySmall,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefiexIcon,
          filled: true,
          fillColor: Colors.white,
          hintText: lableText,

          errorStyle: const TextStyle(
            fontSize: 12.0, // Set the font size of the error text
            color: Colors.red, // Set the color of the error text
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(55) ,
            borderSide: BorderSide(color: Color(0xff004182), width: 2),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(55) ,

            borderSide: BorderSide(color:Color(0xff004182), width: 2),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(55) ,

            borderSide: BorderSide(color: Color(0xff004182), width: 2),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(55) ,

            borderSide: BorderSide(color: Color(0xff004182), width: 2),
          ),
        ),
      ),
    );
  }
}
