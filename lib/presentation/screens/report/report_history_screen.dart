import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/presentation/blocs/report/report_bloc.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({Key? key}) : super(key: key);

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
        child: BlocProvider(
          create: (context) => ReportBloc()..add(ReportEventGet()),
          child: BlocBuilder<ReportBloc, ReportState>(
            builder: (context, state) {
              if (state is ReportStateGet) {
                return Padding(
                  padding: EdgeInsets.all(31),
                  child: ListView(
                    children: [
                      Text(
                        "Layanan Kami",
                        style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 17),
                      ...state.data.asMap().entries.map(
                        (e) {
                          final currentDate = DateTime.parse(e.value.createdAt!);
                          return  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xffCCCCCC)
                              )
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "A01/00${e.key + 1}/${currentDate.day}${currentDate.month}${currentDate.year}/${e.value.noPlat}",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "${currentDate.day}-${currentDate.month}-${currentDate.year}",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        e.value.noPlat!,
                                        style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      const SizedBox(height: 21),
                                      Text(
                                        e.value.alasanLaporan!,
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Status:",
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      Spacer(),
                                      Image.asset("assets/pending.png"),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Pending",
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      )
                    ],
                  ),
                );
              }

              if (state is ReportStateFailed) {
                return Padding(
                  padding: EdgeInsets.all(31),
                  child: ListView(
                    children: [
                      Text(
                        "Layanan Kami",
                        style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
