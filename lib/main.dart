import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:tennis_ai_app/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCHABk4urI0NdTAPzk9eL8MkEgxHcAx930",
    appId: 'com.example.tennis_ai_app',
    messagingSenderId: '571795560797',
    projectId: 'tennis-app-315e3',
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashView());
  }
}
