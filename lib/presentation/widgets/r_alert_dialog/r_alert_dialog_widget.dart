import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RAlertDialogWidget extends StatelessWidget {
  final String title;
  const RAlertDialogWidget({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 29),
            Image.asset("assets/alert.png")
          ],
        ),
      ),
    );
  }
}
