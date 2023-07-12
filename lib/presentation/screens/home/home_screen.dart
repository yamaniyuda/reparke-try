import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/presentation/screens/auth/auth.dart';
import 'package:reparke/presentation/screens/report/report.dart';
import 'package:reparke/presentation/screens/report/report_about_as_screen.dart';
import 'package:reparke/presentation/screens/report/report_history_screen.dart';

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
              child: Stack(
                children: [
                  Image.asset(
                    "assets/Frame 4.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: const Alignment(-1, 1),
                      child: Text(
                        "Laporkan",
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportHistoryScreen(),
                  )
                );
              },
              child: Stack(
                children: [
                  Image.asset(
                    "assets/Frame 2.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: const Alignment(1, 1),
                      child: Text(
                        "Histori Laporan",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportAboutAsScreen(),
                  )
                );
              },
              child: Stack(
                children: [
                  Image.asset(
                    "assets/Frame 5.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: const Alignment(-1, 1),
                      child: Text(
                        "Tentang",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
          ],
        )
      ),
    );
  }
}
