import 'package:flutter/material.dart';
import 'package:ketab/core/widget/disable_custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        height: MediaQuery.sizeOf(context).height * 0.528,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Column(
          children: [
            DisablesCustomTextField(dataText: 'Mohamed Ahmed', iconPrefix: Icons.person, labelText: 'name',),
            DisablesCustomTextField(dataText: 'Mohamed Ahmed@gmail.com', iconPrefix: Icons.email, labelText: 'email',),
            DisablesCustomTextField(dataText: '01148441258', iconPrefix: Icons.phone, labelText: 'phone',),
            DisablesCustomTextField(dataText: 'Giza', iconPrefix: Icons.location_city, labelText: 'city',),
            DisablesCustomTextField(dataText: 'saees', iconPrefix: Icons.edit_location_sharp, labelText: 'address',),
          ],
        ),
      ),
    );
  }
}
