import 'package:flutter/material.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/core/widget/custom_text_form_field.dart';

class ContainerOfTextFieldForRegister extends StatelessWidget {
  ContainerOfTextFieldForRegister({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Styles.kPrimaryColor, width: 3)),
        child: Form(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Name',
                iconPrefix: Icons.person,
                controller: nameController,
                obSecure: false,
                inputType: TextInputType.text,
              ),
              CustomTextFormField(
                hintText: 'Email',
                iconPrefix: Icons.email,
                controller: emailController,
                obSecure: false,
                inputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                hintText: 'Password',
                iconPrefix: Icons.lock,
                controller: passwordController,
                obSecure: true,
                inputType: TextInputType.visiblePassword,
                iconSuffix: Icons.remove_red_eye,
              ),

              CustomTextFormField(
                hintText: 'Password',
                iconPrefix: Icons.lock,
                controller: confirmPasswordController,
                obSecure: true,
                inputType: TextInputType.visiblePassword,
              ),
              CustomButton(buttonName: 'Register', function: () {  },)
            ],
          ),
        ),
      ),
    );
  }
}
