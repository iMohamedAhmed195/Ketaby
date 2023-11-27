import 'package:flutter/material.dart';
import 'package:ketab/core/widget/custom_text_form_field.dart';
import 'package:ketab/core/widget/disable_custom_text_field.dart';
import 'package:ketab/features/profile_feature/presentation/view_model/profile_cubit.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key, required this.name, required this.email, required this.phone, required this.city, required this.address, required this.profileCubit});
  final String name ;
  final String email ;
  final String phone ;
  final String city ;
  final String address ;
  final ProfileCubit profileCubit ;
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
            CustomTextFormField( hintText: name,iconPrefix: Icons.person, function: (value){
              if(value!.isEmpty){
                return 'enter your name again' ;
              }
            }, controller: profileCubit.nameController, obSecure: false, inputType: TextInputType.text,),
            DisablesCustomTextField(dataText: email, iconPrefix: Icons.email, labelText: 'email',),
            CustomTextFormField(hintText: phone, iconPrefix: Icons.phone,controller: profileCubit.phoneController, obSecure: false, inputType: TextInputType.number ,),
            CustomTextFormField(hintText: city, iconPrefix: Icons.location_city,controller: profileCubit.cityController, obSecure: false, inputType: TextInputType.text ,),
            CustomTextFormField(hintText: address, iconPrefix: Icons.edit_location_sharp, controller: profileCubit.addressController, obSecure: false, inputType: TextInputType.text,),
          ],
        ),
      ),
    );
  }
}
