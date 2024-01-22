import 'package:flutter/material.dart';
import 'package:skin_sure/homescreen.dart';
import 'package:skin_sure/login_screen.dart';
import 'package:skin_sure/signup_screen.dart';
void main(){

  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },

      home: const LoginScreen(),
    );
  }
}