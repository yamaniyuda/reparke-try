import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/config/theme/theme.dart';

class RFlushBarWidget {
  static void show(BuildContext context, String title) {
    Flushbar(
      messageText: Text(title, style: GoogleFonts.inter(
        color: Colors.white
      )),
      backgroundColor: primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      messageColor: Colors.white,
      duration: const Duration(seconds: 2),
      titleColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.all(10),
    ).show(context);
  }
}
