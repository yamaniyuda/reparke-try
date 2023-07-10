import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/data/payloads/sign_up_payload.dart';
import 'package:reparke/presentation/blocs/auth/auth_bloc.dart';
import 'package:reparke/presentation/screens/auth/otp_screen.dart';
import 'package:reparke/presentation/widgets/r_alert_dialog/r_alert_dialog_widget.dart';
import 'package:reparke/presentation/widgets/r_flush_bar/r_flush_bar_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_image_picker_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_radio_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_text_field_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
  late SignUpPayload paylaod = SignUpPayload();
  bool _loading = false;

  // begin:: value form
  late String fullName;
  late String optionUpload;
  late String identity;
  late XFile identityDoc;
  late String email;
  late String pin;
  // end:: value form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo.png"),
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {

            if (state is AuthStateLoading) {
              setState(() => _loading = true);
            }

            if (state is AuthStateSingUpSuccess) {
              setState(() => _loading = false);
              showDialog(
                context: context,
                builder: (context) =>
                const RAlertDialogWidget(
                  title: "Periksa Kode OTP\nyang anda dapatkan",
                ),
              );
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(),
                )
              );
            }

            if (state is AuthStateFailed) {
              setState(() => _loading = false);
              RFlushBarWidget.show(context, (state as AuthStateFailed).e);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(31),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Isi Data",
                              style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: 18),
                            RFormTextFieldWidget(
                              onSaved: (value) {
                                setState(() {
                                  fullName = value!;
                                });
                              },
                              hintText: "Masukan Nama Lengkap*",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter some text";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            RFormRadioWidget(
                                onSaved: (value) {
                                  setState(() {
                                    optionUpload = value!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Jenis Data Upload wajib diisi";
                                  }
                                  return null;
                                },
                                title: "Data yang akan anda upload",
                                values: const [
                                  { "ktp": "KTP"},
                                  { "passport": "Passport"}
                                ]
                            ),
                            const SizedBox(height: 18),
                            RFormTextFieldWidget(
                              onSaved: (value) {
                                setState(() {
                                  identity = value!;
                                });
                              },
                              hintText: "Masukan No KTP / Password*",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "No KTP / Password wajib diisi";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            RFormImagePickerWidget(
                              onSaved: (XFile? value) {
                                setState(() {
                                  identityDoc = value!;
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
                            RFormTextFieldWidget(
                              onSaved: (value) {
                                setState(() {
                                  email = value!;
                                });
                              },
                              hintText: "Masukan Email / No HP*",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email / No Hp wajib diisi";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            PinCodeTextField(
                              onSaved: (value) {
                                setState(() {
                                  pin = value!;
                                });
                              },
                              validator: (value) {
                                if (value?.length != 6) {
                                  return "Pin wajib diisi";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              appContext: context,
                              length: 6,
                              controller: _pinController,
                              enableActiveFill: false,
                              cursorHeight: 19,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderWidth: 1,
                                activeColor: Colors.black54,
                                selectedColor: Colors.black54,
                                inactiveColor: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 18),
                            ElevatedButton(
                              onPressed: () {
                                if (_loading == false && _formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  context.read<AuthBloc>().add(AuthEventSignUp(
                                    paylaod.copyWith(
                                      fullName: fullName,
                                      email: email,
                                      pin: pin,
                                      image: identityDoc,
                                      noPassport: identity,
                                      noKtp: identity,
                                      identityType: optionUpload
                                    )
                                  ));
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
                                  "Daftar",
                                  style: TextStyle(
                                      color: Colors.white
                                  )
                              ) : LoadingAnimationWidget.prograssiveDots(
                                  color: Colors.white,
                                  size: 50
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
