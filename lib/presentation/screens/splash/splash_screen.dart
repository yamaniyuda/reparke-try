import 'package:flutter/material.dart';
import 'package:reparke/presentation/screens/auth/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateNextPage();
  }

  void _navigateNextPage() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthScreen()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Image.asset('assets/logo.png', width: 100,),
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Image.asset('assets/logo_kemenhub.png', width: 50),
                  const SizedBox(height: 12),
                  const Text(
                    "Lapa 2023 Official",
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
