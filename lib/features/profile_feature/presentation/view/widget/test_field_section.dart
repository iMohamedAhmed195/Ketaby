import 'package:flutter/material.dart';
import 'package:ketab/core/widget/disable_custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key, required this.name, required this.email, required this.phone, required this.city, required this.address});
  final String name ;
  final String email ;
  final String phone ;
  final String city ;
  final String address ;
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
        child:  Column(
          children: [
            DisablesCustomTextField(dataText: name, iconPrefix: Icons.person, labelText: 'name',),
            DisablesCustomTextField(dataText: email, iconPrefix: Icons.email, labelText: 'email',),
            DisablesCustomTextField(dataText: phone, iconPrefix: Icons.phone, labelText: 'phone',),
            DisablesCustomTextField(dataText: city, iconPrefix: Icons.location_city, labelText: 'city',),
            DisablesCustomTextField(dataText: address, iconPrefix: Icons.edit_location_sharp, labelText: 'address',),
          ],
        ),
      ),
    );
  }
}
