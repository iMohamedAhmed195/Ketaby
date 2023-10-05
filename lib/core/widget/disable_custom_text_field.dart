import 'package:flutter/material.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class DisablesCustomTextField extends StatelessWidget {
  const DisablesCustomTextField({super.key, required this.dataText, required this.iconPrefix, required this.labelText});
  final String dataText;
  final String labelText;
  final IconData iconPrefix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
      child: TextFormField(
        readOnly: true,
        autofocus : true ,
        decoration: InputDecoration(
            hintText:dataText ,

            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            prefixIcon: Icon(
              iconPrefix,
              color: Styles.kPrimaryColor,
            ),
        ),

      ),
    );
  }
}
