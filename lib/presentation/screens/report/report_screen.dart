import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/presentation/blocs/report/report_bloc.dart';
import 'package:reparke/presentation/screens/report/report_success_screen.dart';
import 'package:reparke/presentation/widgets/r_alert_dialog/r_alert_dialog_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_dropdown_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_image_picker_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_text_field_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;
  late List<String> currendDataMerek = [];
  final List<List<String>> dataMerek = [
    ["Honda", "Yamaha", "Suzuki", "Kawasaki", "TVS", "Bajaj", "KTM", "Vespa (Piaggio)", "Ducati", "Harley-Davidson"],
    [ "Toyota", "Honda", "Suzuki", "Mitsubishi", "Nissan", "Daihatsu", "Mazda", "Isuzu", "Subaru","Hyundai","Kia","Ford","Chevrolet","BMW","Mercedes-Benz","Audi","Volkswagen","Volvo","Peugeot","Renault","Proton"],
    [ "Hino", "Mitsubishi Fuso", "Isuzu", "Nissan Diesel (UD Trucks)", "Mercedes-Benz", "Scania", "Volvo", "MAN", "Hyundai", "Tata Motors"]
  ];

  //
  late String vehicleRype;
  late String chooseMerk;
  late String locationReport;
  late XFile image;
  late String reasonReport;
  late String noPlat;
  late String warna;
  late String detail;

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
          create: (context) => ReportBloc(),
          child: BlocConsumer<ReportBloc, ReportState>(
            listener: (context, state) async {
              if (state is ReportStateLoading) {
                _loading = true;
              }

              if (state is ReportStateSuccess) {
                _loading = false;
                showDialog(
                  context: context,
                  builder: (context) =>
                  const RAlertDialogWidget(
                    title: "Sedang memproses\nlaporan anda",
                  ),
                );
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportSuccessScreen(),
                    )
                );
              }
            },
            builder: (context, state) {
              return Form(
                    key: _formKey,
                      child: ListView(
                        padding: const EdgeInsets.all(31),
                        children: [
                          Text(
                            "Laporkan",
                            style: GoogleFonts.inter(
                              fontSize: 28,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffFFD19F),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.warning_amber_rounded, color: Color(0xffFBBC04), size: 40,),
                                Flexible(
                                  child: Text(
                                    "Pastikan anda telah berusaha untuk menyelesaikan masalah dengan berbicara dengan pemilik kendaraan yang mau dilapor sebelum melaporkan. Bila mereka bisa bekerja sama, Anda tidak perlu melaporkan",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.inter(
                                        fontSize: 10
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          RFormDropDownWidget(
                            onSaved: (value) {
                              setState(() => vehicleRype = value!);
                            },
                            onChange: (value) {
                              switch (value) {
                                case "Motor": {
                                  setState(() => currendDataMerek = dataMerek[0]);
                                  break;
                                }
                                case "Mobil": {
                                  setState(() => currendDataMerek = dataMerek[1]);
                                  break;
                                }
                                case "Truk": {
                                  setState(() => currendDataMerek = dataMerek[2]);
                                  break;
                                }
                              }
                            },
                            hintText: "Pilih Tipe Kendaraan",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                            items: const ["Motor", "Mobil", "Truk"]
                          ),
                          const SizedBox(height: 18),
                          RFormDropDownWidget(
                              onSaved: (value) {
                                setState(() => chooseMerk = value!);
                              },
                              hintText: "Pilih Merek Kendaraan*",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter some text";
                                }
                                return null;
                              },
                              items: currendDataMerek
                          ),
                          const SizedBox(height: 18),
                          RFormTextFieldWidget(
                            onSaved: (value) {
                              setState(() {
                                setState(() => reasonReport = value!);
                              });
                            },
                            hintText: "Alasan Melapor*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          RFormImagePickerWidget(
                            onSaved: (XFile? value) {
                              setState(() {
                                setState(() => image = value!);
                              });
                            },
                            suffixIcon: Icon(Icons.car_crash),
                            validator: (value) {
                              if (value == null) {
                                return "Gambar wajib diisi";
                              }
                              return null;
                            },
                            hintText: "Upload Foto Kendaraan*",
                          ),
                          const SizedBox(height: 18),
                          RFormTextFieldWidget(
                            onSaved: (value) {
                              setState(() {
                                setState(() => locationReport = value!);
                              });
                            },
                            hintText: "Lokasi Kejadian*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Flexible(
                                flex: 5,
                                fit: FlexFit.tight,
                                child: RFormTextFieldWidget(
                                  onSaved: (value) {
                                    setState(() {
                                      noPlat = value!;
                                    });
                                  },
                                  hintText: "No. Plat*",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter some text";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: SizedBox(width: 10),
                              ),
                              Flexible(
                                flex: 5,
                                fit: FlexFit.tight,
                                child: RFormTextFieldWidget(
                                  onSaved: (value) {
                                    setState(() {
                                      warna = value!;
                                    });
                                  },
                                  hintText: "Warna*",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter some text";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          RFormTextFieldWidget(
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            onSaved: (value) {
                              setState(() {
                                setState(() => detail = value!);
                              });
                            },
                            hintText: "Detail Lainya...*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18,),
                          ElevatedButton(
                            onPressed: () {
                              if (_loading == false && _formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                context.read<ReportBloc>().add(
                                  ReportEventCreate(
                                    ReportCreatePayload(
                                      image: image,
                                      tipeKendaraan: vehicleRype,
                                      alasanLaporan: reasonReport,
                                      detail: detail,
                                      lokasiKejadian: locationReport,
                                      merekKendaraan: chooseMerk,
                                      noPlat: noPlat,
                                      warna: warna
                                    )
                                  )
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                minimumSize: const Size.fromHeight(50)
                            ),
                            child: _loading == false ? const Text(
                                "Laporkan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54
                                )
                            ) : LoadingAnimationWidget.prograssiveDots(
                                color: Colors.black54,
                                size: 50
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
