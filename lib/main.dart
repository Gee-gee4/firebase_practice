import 'package:firebase_practice/pages/signin_page.dart';
import 'package:flutter/material.dart';

void main()  {
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}