import 'package:authentication/constants/constants.dart';
import 'package:authentication/helpers/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final validator;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
       this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
         borderSide: BorderSide(color: kWhiteColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kWhiteColor), 
        ),
        fillColor:kgreyColor,
        filled: true,
        hintText: hintText,
        hintStyle:hintStyle
      ),

      validator: validator
    
    );
  }
}
