import 'package:flutter/material.dart';
import 'package:reparke/presentation/screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, primary: const Color(0xffFF0303)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent
        )
      ),
      home: const SplashScreen(),
    );
  }
}