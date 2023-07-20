import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/presentation/blocs/auth/auth_bloc.dart';
import 'package:reparke/presentation/screens/auth/otp_screen.dart';
import 'package:reparke/presentation/widgets/r_alert_dialog/r_alert_dialog_widget.dart';
import 'package:reparke/presentation/widgets/r_flush_bar/r_flush_bar_widget.dart';
import 'package:reparke/presentation/widgets/r_form/r_form_text_field_widget.dart';

import '../../../data/payloads/send_otp_reset_pin_payload.dart';

class ForgetPinScreen extends StatefulWidget {
  const ForgetPinScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPinScreen> createState() => _ForgetPinScreenState();
}

class _ForgetPinScreenState extends State<ForgetPinScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _isLoading = false;

  late String _telpField;
  late String _emailField;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset("assets/logo.png", width: 30)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthStateLoading) {
                setState(() => _isLoading = true);
              }

              if (state is AuthStateForgetPinOtpSuccess) {showDialog(
                context: context,
                builder: (context) =>
                  const RAlertDialogWidget(
                    title: "Periksa Kode OTP\nyang anda dapatkan",
                  ),
                );
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(isSignUp: false),
                  )
                );
              }

              if (state is AuthStateFailed) {
                setState(() => _isLoading = false);
                RFlushBarWidget.show(context, state.e);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reset Pin",
                              style: GoogleFonts.inter(
                                  fontSize: 28,
                                  color: blueColor,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: 22,),
                            RFormTextFieldWidget(
                              hintText: "Masukan Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email wajib diisi";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  _emailField = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_isLoading == false && _formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            context.read<AuthBloc>().add(
                              AuthEventForgetPin(
                                SendOTPResetPinPayload(
                                  identity: _emailField,

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
                        child: _isLoading
                          ? LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white,
                              size: 50
                            )
                          : Text(
                            "Reset Pin",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                color: blueColor,
                                fontSize: 20
                              )
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
