import 'package:go_router/go_router.dart';
import 'package:ketab/features/login_feature/presentation/view/login_view.dart';
import 'package:ketab/features/on_boarding_view_feature/presentation/views/on_boarding_screen.dart';

import 'package:ketab/features/register_feature/presentation/view/register_view.dart';
import 'package:ketab/features/splash_view_feature/splash_view.dart';


abstract class AppRouter {
  static const kOnBoarding = '/kOnBoarding';
  static const kLogin = '/Login';
  static const kRegister = '/Register';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>   const SplashView(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) =>   const OnBoardingScreen(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) =>   const LoginView(),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) =>   const RegisterView(),
      ),


    ],
  );
}
