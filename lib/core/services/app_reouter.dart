
import 'package:go_router/go_router.dart';
import 'package:ketab/features/on_boarding_view_feature/presentation/views/on_boarding_screen.dart';
import 'package:ketab/features/splash_view_feature/splash_view.dart';


abstract class AppRouter {
  static const kOnboarding = '/onBoarding';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>   const SplashView(),
      ),
      GoRoute(
        path: kOnboarding,
        builder: (context, state) =>   const OnBoardingScreen(),
      ),

    ],
  );
}
