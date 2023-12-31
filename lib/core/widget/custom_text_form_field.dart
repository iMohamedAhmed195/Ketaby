import 'package:flutter/material.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.iconPrefix,
      this.function,
      required this.controller,
      required this.obSecure,
      required this.inputType,this.iconSuffix,this.sufFunction});

  final String hintText;
  final IconData iconPrefix;
  final IconData? iconSuffix;
  final String? Function(String?)? function;
  final void Function()? sufFunction;
  final TextEditingController controller;
  final bool obSecure;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
      child: TextFormField(
        validator: function,
        decoration: InputDecoration(

            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Styles.kPrimaryColor)),
            prefixIcon: Icon(
              iconPrefix,
              color: Styles.kPrimaryColor,
            ),
            suffixIcon: IconButton(
                onPressed: sufFunction,
                icon: Icon(
                  iconSuffix,
                  color: Styles.kPrimaryColor,
                ))),
        controller: controller,
        obscureText: obSecure,
        keyboardType: inputType,
      ),
    );
  }
}
