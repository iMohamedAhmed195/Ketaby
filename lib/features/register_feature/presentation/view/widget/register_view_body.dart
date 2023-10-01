import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ketab/core/services/app_reouter.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/core/widget/image_text_section.dart';
import 'package:ketab/features/register_feature/presentation/view/widget/container_of_text_field_for_register.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child:  Column(
            children: [
              const ImageAndTextSection(namePage: 'Join Us!',),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0 , right: 20.0 ),
                child: Row(
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700]
                      ),
                    ),
                    const SizedBox(width: 10,),
                    TextButton(
                        onPressed: (){
                          GoRouter.of(context).push(AppRouter.kLogin);
                        },
                        child: const Text(
                            'Log in!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Styles.kPrimaryColor,
                            )
                        ))

                  ],
                ),
              ),
              ContainerOfTextFieldForRegister()
            ],
          )
      ),
    );
  }
}
