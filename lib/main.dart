import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/firebase_options.dart';
import 'package:firebase_practice/hidden_drawer.dart';
// import 'package:firebase_practice/pages/signin_page.dart';
import 'package:firebase_practice/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
        '/': (context) => const HiddenDrawer(),
      },
    );
  }
}
