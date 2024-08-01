import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: AppColors.primary,
                statusBarIconBrightness: Brightness.light)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff183E9F)),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
