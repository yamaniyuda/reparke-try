import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/data/payloads/verify_reset_pin_payload.dart';
import 'package:reparke/data/payloads/verify_sign_up_payload.dart';
import 'package:reparke/domain/use_cases/auth/send_otp_use_case.dart';
import 'package:reparke/presentation/blocs/auth/auth_bloc.dart';
import 'package:reparke/presentation/screens/auth/pin_screen.dart';
import 'package:reparke/presentation/screens/home/home_screen.dart';
import 'package:reparke/presentation/widgets/r_alert_dialog/r_alert_dialog_widget.dart';
import 'package:reparke/presentation/widgets/r_flush_bar/r_flush_bar_widget.dart';

class OtpScreen extends StatefulWidget {
  late bool isSignUp;
  late String? email;

  OtpScreen({
    this.email,
    this.isSignUp = true,
    Key? key
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _controller = TextEditingController();
  late bool _isValidate;
  late bool _isLoading = false;
  late VerifySignUpPayload payload = VerifySignUpPayload();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset("assets/icon.png", width: 30)
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

              if (state is AuthStateVerifySignUpSuccess) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const RAlertDialogWidget(title: "Anda berhasil login\nke akun anda")
                );
                await Future.delayed(const Duration(seconds: 2));
                if (!context.mounted) return;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PinScreen(onNext: () {})),
                  (route) => false
                );
              }

              if (state is AuthStateForgetPinOtpSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinScreen(onNext: () {}, isSignIn: false),
                  )
                );
              }

              if (state is AuthStateFailed) {
                setState(() => _isLoading = false);
                RFlushBarWidget.show(context, state.e);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.all(31),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.isSignUp ? "Masukkan Kode OTP" : "Reset Pin",
                            style: GoogleFonts.inter(
                                fontSize: 28,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 23),
                          Text(
                            "Masukan Kode OTP",
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 21),
                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            appContext: context,
                            length:4,
                            controller: _controller,
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
                          const SizedBox(height: 21),
                          GestureDetector(
                            onTap: () async {
                              await SendOtpUseCase().call();
                            },
                            child: const Text(
                              "Kirim Ulang Kode Otp?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (widget.isSignUp) {
                              setState(() {
                                payload = payload.copyWith(
                                  otp: int.parse(_controller.text)
                                );
                              });
                              context.read<AuthBloc>().add(AuthEventVerifySignUp(payload));
                            }

                            if (widget.isSignUp == false) {
                              context.read<AuthBloc>().add(
                                AuthEventVerifyResetPin(
                                  VerifyResetPinPayload(
                                    identity: widget.email,
                                    otp: _controller.text
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
                          child: Text(
                            widget.isSignUp ? "Masuk" : "Lanjut",
                            style: const TextStyle(
                              color: Colors.black54
                            )
                          ),
                        ),
                        const SizedBox(height: 25),
                        if (widget.isSignUp) GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Belum punya akun ?",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
