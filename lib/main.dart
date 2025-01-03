import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/firebase_options.dart';
import 'package:firebase_practice/model/playlist_provider.dart';
import 'package:firebase_practice/pages/signin_page.dart';
import 'package:firebase_practice/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: "https://qqmbsstwcheybjhloppl.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFxbWJzc3R3Y2hleWJqaGxvcHBsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU0Nzc5NjMsImV4cCI6MjA1MTA1Mzk2M30.sHEJizTipGupmoFNj7dIK4aumRhAC-dMQbE_muExMno",
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,

      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: false,
      // ),
      debugShowCheckedModeBanner: false,
      // home: SignInPage(),
      initialRoute: '/',
      routes: {
        '/': (context) =>  SignInPage(),
      },
    );
  }
}
