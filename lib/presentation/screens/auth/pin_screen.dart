import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reparke/config/theme/theme.dart';
import 'package:reparke/data/payloads/new_pin_payload.dart';
import 'package:reparke/data/payloads/sign_in_payload.dart';
import 'package:reparke/presentation/blocs/auth/auth_bloc.dart';
import 'package:reparke/presentation/screens/auth/forget_pin_screen.dart';
import 'package:reparke/presentation/screens/auth/sign_up_screen.dart';
import 'package:reparke/presentation/screens/home/home_screen.dart';
import 'package:reparke/presentation/widgets/r_alert_dialog/r_alert_dialog_widget.dart';
import 'package:reparke/presentation/widgets/r_flush_bar/r_flush_bar_widget.dart';

class PinScreen extends StatefulWidget {
  final VoidCallback onNext;
  late bool isSignIn;

  PinScreen({
    required this.onNext,
    this.isSignIn = true,
    Key? key
  }) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _controller = TextEditingController();
  late bool _isLoading = false;
  late bool _isValidate;

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
          create: (context) =>
          AuthBloc(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthStateLoading) {
                setState(() => _isLoading = true);
              }

              if (state is AuthStateSignInSuccess) {
                setState(() => _isLoading = false);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const RAlertDialogWidget(title: "Anda berhasil login\nke akun anda")
                );

                await Future.delayed(const Duration(seconds: 2));
                if (!context.mounted) return;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false
                );
              }
  
              if (state is AuthStateResetPinSuccess) {
                setState(() => _isLoading = false);
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

              if (state is AuthStateFailed) {
                setState(() => _isLoading = false);
                RFlushBarWidget.show(context, state.e);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false
                );
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
                            widget.isSignIn ? "Masuk" : "Reset Pin",
                            style: GoogleFonts.inter(
                              color: blueColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 23),
                          Text(
                            widget.isSignIn
                                ? "Masukan Pin Anda"
                                : "Masukan Pin Baru",
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 21),
                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            appContext: context,
                            length: 6,
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
                          if (widget.isSignIn) ...[
                            const SizedBox(height: 21),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgetPinScreen(),
                                  )
                                );
                              },
                              child: const Text(
                                "Lupa Pin Anda ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ]
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
                            if (widget.isSignIn) {
                              context.read<AuthBloc>().add(AuthEventSignIn(
                                SignInPayload(
                                  pin: int.parse(_controller.text)
                                )
                              ));
                            }

                            if (widget.isSignIn == false) {
                              context.read<AuthBloc>().add(
                                AuthEventResetPin(
                                  NewPinPayload(
                                    pin: _controller.text
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
                          child: _isLoading ? LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white,
                              size: 50
                          ) : Text(
                              widget.isSignIn ? "Masuk" : "Lanjut",
                              style: GoogleFonts.inter(
                                color: blueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                              )
                          ),
                        ),
                        const SizedBox(height: 25),
                        if (widget.isSignIn) GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              )
                            );
                          },
                          child: Text(
                            "Belum punya akun ?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: blueColor
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
