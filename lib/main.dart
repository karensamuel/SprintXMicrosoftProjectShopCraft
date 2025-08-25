import 'package:flutter/material.dart';
import 'package:shopcraft/landing_page.dart';
import 'package:shopcraft/sign_in.dart';
import 'package:shopcraft/sign_up.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>LandingPage(),
        '/SignIn':(context)=>SignIn(),
        '/SignUp':(context)=>SignUp(),
      }
      ,
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
      ),


    );
  }
}
