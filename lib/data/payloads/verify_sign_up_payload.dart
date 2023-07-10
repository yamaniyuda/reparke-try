import 'package:reparke/data/payloads/payload.dart';

class VerifySignUpPayload extends Payload {
  final String? userId;
  final int? otp;

  VerifySignUpPayload({
    this.otp,
    this.userId
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "otp": otp
    };
  }

  VerifySignUpPayload copyWith({
    String? userId,
    int? otp
  }) {
    return VerifySignUpPayload(
      otp: otp ?? this.otp,
      userId: userId ?? this.userId
    );
  }
}