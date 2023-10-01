
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/core/widget/custom_button.dart';
import 'package:ketab/core/widget/custom_text_form_field.dart';
import 'package:ketab/features/login_feature/presentation/view_model/login_cubit.dart';

class ContainerOfTextField extends StatelessWidget {
  const ContainerOfTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccess){
            print( ' log  in successs ========= >>>>>>>>>>');
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
                key: sl<LoginCubit>().formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Email',
                      function: (value){
                        if(value!.isEmpty ){
                          return sl<LoginCubit>().failureLoginModel!.errors!.email![0] ;
                        }
                        return null ;
                      },
                      iconPrefix: Icons.email,
                      controller: sl<LoginCubit>().emailController,
                      obSecure: false,
                      inputType: TextInputType.text,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      function: (value){
                        if(value!.isEmpty ){
                          return sl<LoginCubit>().failureLoginModel!.errors!.password![0] ;
                        }
                        return null ;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<LoginCubit>().passwordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                      iconSuffix: Icons.remove_red_eye,
                    ),
                CustomButton(buttonName: 'Login', function: () {
                  sl<LoginCubit>().loginUser();
                  if( sl<LoginCubit>().formKey.currentState!.validate()) {

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
