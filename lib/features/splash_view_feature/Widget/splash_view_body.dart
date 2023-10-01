import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ketab/core/services/app_reouter.dart';
import 'package:ketab/core/utils/constants/assets.dart';
import 'package:ketab/features/splash_view_feature/Widget/sliding_text.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimations();
    initNavigateToHomeView();

  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void initSlidingAnimations(){
  animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  slidingAnimation =
      Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
          .animate(animationController);
  animationController.forward();
}

  void initNavigateToHomeView(){
    Future.delayed(const Duration(seconds: 2),(){
       GoRouter.of(context).push(AppRouter.kOnBoarding);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 220,
            width: 190,
            child: Image.asset(AssetsData.logo,),
          ),
          const SizedBox(
            height: 15,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ]);
  }
}
