import 'package:flutter/material.dart';
import 'package:ketab/features/register_feature/presentation/view/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(child: RegisterViewBody())
    );
  }
}
