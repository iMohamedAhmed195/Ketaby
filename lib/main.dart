import 'package:flutter/material.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/app_reouter.dart';
import 'package:ketab/core/services/service_locator.dart';

void main() {
  ServiceLocator().init();
  sl<DioHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

