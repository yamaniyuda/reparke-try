import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/presentation/screens/auth/pin_screen.dart';
import 'package:reparke/presentation/screens/auth/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 48,
                left: 33
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Solusi Parkirmu",
                    style: GoogleFonts.inter(
                      fontSize: 34,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Foto, Lapor, Tertib & lancar",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Center(
                child: Image.asset("assets/logo.png", width: 100, height: 100, fit: BoxFit.cover),
              )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PinScreen(
                            onNext: () {}
                          )
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      minimumSize: const Size.fromHeight(50)
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black54
                      )
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen()
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      minimumSize: const Size.fromHeight(50)
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                          color: Colors.black54
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
