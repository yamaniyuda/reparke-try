import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/config/theme/theme.dart';

class ReportSuccessScreen extends StatelessWidget {
  const ReportSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terima Kasih",
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 54),
              Icon(Icons.check_circle_outline, color: Colors.green, size: 150),
              SizedBox(height: 52),
              Text(
                "“ Dengan Kontribusi Anda dalam Melaporkan Kesalahan atau Pelanggaran yang ada, anda telah menjadi seorang warga negara yang baik yang membantu perkembangan negara Indonesia ini “",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Regards - Reparke",
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.italic,
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text(
              "Cek History",
              style: GoogleFonts.inter(
                color: Colors.black54,
                fontSize: 16
              ),
            ),
          ),
        )
      )
    );
  }
}
