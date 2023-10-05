import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/image_proifle_section.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/test_field_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const ImageProfileSection(),
          const TextFieldSection(),
                CustomButton(function: () {  }, buttonName: 'Edit Profile',)
        ],
      ),
    );
  }
}
