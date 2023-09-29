import 'package:flutter/material.dart';
import 'package:ketab/core/services/app_reouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

