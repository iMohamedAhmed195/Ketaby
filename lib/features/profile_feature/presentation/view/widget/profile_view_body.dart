import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/image_proifle_section.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/test_field_section.dart';
import 'package:ketab/features/profile_feature/presentation/view_model/profile_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getDataProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return sl<ProfileCubit>().profileModel !=null ?
          SingleChildScrollView(
            child: Column(
              children: [
                ImageProfileSection(
                  image: sl<ProfileCubit>().image,
                ),
                TextFieldSection(
                  name: sl<ProfileCubit>().name,
                  email: sl<ProfileCubit>().email,
                  phone:sl<ProfileCubit>().phone,
                  city: sl<ProfileCubit>().city,
                  address: sl<ProfileCubit>().address,
                ),
                CustomButton(
                  function: () {},
                  buttonName: 'Edit Profile',
                )
              ],
            ),
          ) : const Column(children: [
              Center(child: Text('waiting please getting data'))
            ],);
        },
      ),
    );
  }
}
