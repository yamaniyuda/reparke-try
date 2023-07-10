import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/presentation/screens/auth/auth.dart';
import 'package:reparke/presentation/screens/report/report.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 31),
          child: Image.asset("assets/logo.png"),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ),
                (route) => false
              );
            },
            child: Icon(Icons.logout),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 31
          ),
          children: [
            Text(
              "Layanan Kami",
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportScreen(),
                  )
                );
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Frame 2.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Frame 4.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            const SizedBox(height: 18),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Frame 5.png"),
                    fit: BoxFit.cover
                  )
              ),
            ),
            const SizedBox(height: 18),
          ],
        )
      ),
    );
  }
}
