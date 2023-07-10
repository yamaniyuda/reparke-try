import 'package:reparke/data/payloads/payload.dart';

class SignInPayload extends Payload {
  final String? userId;
  final int? pin;

  SignInPayload({
    this.userId,
    this.pin
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "pin": pin
    };
  }

  SignInPayload copyWith({
    String? userId,
    int? pin
  }) {
    return SignInPayload(
      userId: userId ?? this.userId,
      pin: pin ?? this.pin
    );
  }
}