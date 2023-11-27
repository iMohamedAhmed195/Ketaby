import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/services/show_toast.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/image_proifle_section.dart';
import 'package:ketab/features/profile_feature/presentation/view/widget/test_field_section.dart';
import 'package:ketab/features/profile_feature/presentation/view_model/profile_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = sl<ProfileCubit>();
    return BlocProvider(
      create: (context) => profileCubit..getDataProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if(state is EditProfileLoading){
            showToast(text: 'waiting change data', state: ToastState.warning);
          }else if( state is EditProfileSuccess){
            showToast(text: 'data change successfully', state: ToastState.success);


          }
        },
        builder: (context, state) {
          return profileCubit.profileModel !=null ?
          SingleChildScrollView(
            child: Form(
              key: profileCubit.formKey,
              child: Column(
                children: [
                  ImageProfileSection(
                    image: profileCubit.image,
                  ),
                  TextFieldSection(
                    name: profileCubit.name,
                    email: profileCubit.email,
                    phone:profileCubit.phone,
                    city: profileCubit.city,
                    address: profileCubit.address,
                    profileCubit: profileCubit,
                  ),
                  CustomButton(
                    function: () {
                      if(profileCubit.formKey.currentState!.validate()){
                        profileCubit.editDataProfile();
                      }

                    },
                    buttonName: 'Edit Profile',
                  )
                ],
              ),
            ),
          ) : const Column(children: [
              Center(child: Text('waiting please getting data'))
            ],);
        },
      ),
    );
  }
}
