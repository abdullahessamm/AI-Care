import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/presentation/blocs/auth/auth_bloc.dart';
import 'package:ai_care/presentation/views/auth_view.dart';
import 'package:ai_care/presentation/views/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(create: (context) => AuthBloc(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    // PatientsStoreRepository().all.then((res) {});

    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(CheckIfLoggedInEvent());
    authBloc.stream.listen((AuthState state) {
      setState(() {
        isLoggedIn = state is Authenticated;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Care',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: AppColors.primary,
                statusBarIconBrightness: Brightness.light)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const MainView() : const AuthView(),
    );
  }
}
