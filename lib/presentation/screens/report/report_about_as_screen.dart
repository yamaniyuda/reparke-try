import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportAboutAsScreen extends StatelessWidget {
  const ReportAboutAsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_rounded)
              ),
              Spacer(),
              Image.asset("assets/icon.png", width: 30)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(31),
          children: [
            Text(
              "Tentang Kami",
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Mari kita tingkatkan kesadaran etika berlalu lintas dan keamanan jalan raya bersama-sama sebagai warga negara yang bertanggung jawab di Indonesia!\n\nDengan menggunakan aplikasi ini, Anda telah menjadi kontributor utama dalam menjaga ketertiban lalu lintas dan keamanan jalan. Setiap pelaporan yang Anda lakukan tentang kendaraan yang parkir secara ilegal adalah langkah penting menuju jalan yang lebih aman bagi kita semua.\n\nAplikasi ini sudah digunakan oleh Anda sebagai wujud kepedulian terhadap keselamatan dan kenyamanan pengguna jalan lainnya. Dengan melaporkan pelanggaran parkir ilegal, Anda membantu mencegah kemacetan, mengurangi risiko kecelakaan, dan menciptakan lingkungan yang lebih aman untuk kita semua.\n\nDalam menjalankan peran Anda sebagai warga negara yang bertanggung jawab, Anda telah berkontribusi dalam membangun Indonesia yang lebih maju. Bersama-sama, kita menciptakan perubahan positif dengan mengutamakan keselamatan, menjaga ketertiban lalu lintas, dan membangun budaya pengemudi yang bertanggung jawab.\n\nTeruslah menggunakan aplikasi ini sebagai alat untuk memperkuat kepedulian kita terhadap peraturan lalu lintas dan keselamatan jalan. Bersama-sama, mari kita perjuangkan jalan yang aman dan tertib untuk kita, keluarga, dan sesama pengguna jalan.\n\nTerima kasih telah berkontribusi sebagai warga negara yang bertanggung jawab dan terus menjadi contoh yang baik bagi yang lain. Kita bergerak maju untuk mencapai tujuan bersama: jalan raya yang lebih aman dan berkualitas tinggi untuk kebaikan kita semua.",
              style: GoogleFonts.inter(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
