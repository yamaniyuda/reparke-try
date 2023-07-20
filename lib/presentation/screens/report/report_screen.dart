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
  late List<XFile?> image;
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
              Image.asset("assets/logo.png", width: 30)
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
                          fontWeight: FontWeight.w700,
                          color: blueColor
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
                            const SizedBox(width: 10,),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Colors.black54
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Pastikan anda telah berusaha untuk menyelesaikan masalah dengan berbicara dengan pemilik kendaraan yang mau dilapor sebelum melaporkan. Bila mereka bisa bekerja sama,",
                                    ),
                                    TextSpan(
                                      text: "Anda tidak perlu melaporkan",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ]
                                ),
                              )
                            )
                            // overflow: TextOverflow.clip,
                            // style: GoogleFonts.inter(
                            //     fontSize: 12
                            // ),
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
                      RFormTextFieldWidget(
                        onSaved: (value) {
                          setState(() {
                            print(value);
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
                        onSaved: (List<XFile?> value) {
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
                        typePicker: TypePicker.multiple,
                        hintText: "Upload Foto Kendaraan*",
                        maxLines: 100,
                      ),
                      const SizedBox(height: 18),
                      RFormTextFieldWidget(
                        onSaved: (value) {
                          setState(() {
                            setState(() => locationReport = value!);
                          });
                        },
                        suffixIcon: const Icon(Icons.location_on),
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
                        hintText: "Detail Lainya (Merek Kendaraan, dll)",
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

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              alignment: Alignment.center,
                              title: Text("PERHATIAN!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  color: blueColor
                                ),
                              ),
                              content: Container(
                                height: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Apabila terdapat adanya laporan palsu atau menggangu aktivitas penindakan akan dikenakan Pasal 220 KUHP dengan pidana penjara paling lama satu tahun empat bulan.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Pastikan: \n Anda telah berusaha menyelesaikan masalah ini dengan verbal dengan pemilik kendaraan atau petugas parkir dengan baik sebelum melakukan laporan!",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              actions: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Kembali",
                                      style: GoogleFonts.inter(
                                        color: blueColor
                                      ),
                                    )
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(primaryColor)
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Tetap Melapor",
                                        style: GoogleFonts.inter(
                                          color: blueColor
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                          );

                          // if (_loading == false && _formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   context.read<ReportBloc>().add(
                          //     ReportEventCreate(
                          //       ReportCreatePayload(
                          //         image: image,
                          //         tipeKendaraan: vehicleRype,
                          //         alasanLaporan: reasonReport,
                          //         detail: detail,
                          //         lokasiKejadian: locationReport,
                          //         merekKendaraan: chooseMerk,
                          //         noPlat: noPlat,
                          //         warna: warna
                          //       )
                          //     )
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            minimumSize: const Size.fromHeight(50)
                        ),
                        child: _loading == false ? Text(
                            "Laporkan",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              color: blueColor,
                              fontSize: 20
                            )
                        ) : LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white,
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
