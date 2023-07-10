import 'package:reparke/data/payloads/payload.dart';

class SendOTPResetPinPayload extends Payload {
  final String? identity;

  SendOTPResetPinPayload({
    this.identity
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "identity": identity
    };
  }

  SendOTPResetPinPayload copyWith({
    String? identity
  }) {
    return SendOTPResetPinPayload(
      identity: identity ?? this.identity
    );
  }
}