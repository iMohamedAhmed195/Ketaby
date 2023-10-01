import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/core/widget/custom_text_form_field.dart';
import 'package:ketab/features/register_feature/presentation/view_model/register_cubit.dart';

class ContainerOfTextFieldForRegister extends StatelessWidget {
  const ContainerOfTextFieldForRegister({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccess){
            print('========> register successss is nowwwwwwwwwww') ;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Styles.kPrimaryColor, width: 3)),
              child: Form(
                key: sl<RegisterCubit>().registerKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      function: (value){
                          if(value!.isEmpty){
                            print(sl<RegisterCubit>().failureRegisterModel!.errors!.name![0]);
                           return sl<RegisterCubit>().failureRegisterModel!.errors!.name![0];
                          }
                          return null ;
                      },
                      iconPrefix: Icons.person,
                      controller: sl<RegisterCubit>().nameController,
                      obSecure: false,
                      inputType: TextInputType.text,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      function: (value){
                        if(value!.isEmpty){
                          print(sl<RegisterCubit>().failureRegisterModel!.errors!.name![0]);
                          return sl<RegisterCubit>().failureRegisterModel!.errors!.email![0];
                        }
                        return null ;
                      },
                      iconPrefix: Icons.email,
                      controller: sl<RegisterCubit>().emailController,
                      obSecure: false,
                      inputType: TextInputType.emailAddress,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      function: (value){
                        if(value!.isEmpty){
                          print(sl<RegisterCubit>().failureRegisterModel!.errors!.name![0]);
                          return sl<RegisterCubit>().failureRegisterModel!.errors!.password![0];
                        }
                        return null ;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<RegisterCubit>().passwordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                      iconSuffix: Icons.remove_red_eye,
                    ),

                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      function: (value){
                        if(value!.isEmpty){
                          print(sl<RegisterCubit>().failureRegisterModel!.errors!.name![0]);
                          return sl<RegisterCubit>().failureRegisterModel!.errors!.email![0];
                        }
                        return null ;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<RegisterCubit>().confirmPasswordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                    ),
                    CustomButton(buttonName: 'Register', function: () {
                      sl<RegisterCubit>().registerInApp();
                      if( sl<RegisterCubit>().registerKey.currentState!.validate()) {

                      }
                    },)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
