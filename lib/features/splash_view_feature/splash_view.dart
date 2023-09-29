
import 'package:flutter/material.dart';
import 'package:ketab/core/constants/colors.dart';
import 'package:ketab/features/splash_view_feature/Widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.kPrimaryColor,
      body: SplashViewBody()
    );
  }
}
