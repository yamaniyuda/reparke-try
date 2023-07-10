import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_image_picker_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_text_field_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
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
              RFormTextFieldWidget(
                onSaved: (value) {
                  setState(() {
                    // fullName = value!;
                  });
                },
                hintText: "Tipe Kendaraan*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              RFormTextFieldWidget(
                onSaved: (value) {
                  setState(() {
                    // fullName = value!;
                  });
                },
                hintText: "Merek Kendaraan*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              RFormTextFieldWidget(
                onSaved: (value) {
                  setState(() {
                    // fullName = value!;
                  });
                },
                hintText: "Alasan Laporan*",
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
                    // identityDoc = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Gambar wajib diisi";
                  }
                  return null;
                },
                hintText: "Upload Foto KTP/Password",
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
                          // fullName = value!;
                        });
                      },
                      hintText: "Alasan Laporan*",
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
                          // fullName = value!;
                        });
                      },
                      hintText: "Alasan Laporan*",
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
                    // fullName = value!;
                  });
                },
                hintText: "Alasan Laporan*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
