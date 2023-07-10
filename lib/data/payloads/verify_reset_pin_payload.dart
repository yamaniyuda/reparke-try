import 'package:reparke/data/payloads/payload.dart';

class VerifyResetPinPayload extends Payload{
  final String? identity;
  final String? otp;

  VerifyResetPinPayload({
    this.identity,
    this.otp
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "identity": identity,
      "otp": otp
    };
  }

  VerifyResetPinPayload copyWith({
    String? identity,
    String? otp
  }) {
    return VerifyResetPinPayload(
      otp: otp ?? this.otp,
      identity: identity ?? this.identity
    );
  }
}