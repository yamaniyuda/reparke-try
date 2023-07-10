import 'package:reparke/data/payloads/payload.dart';

class SendOtpPayload extends Payload {
  final String? type;
  final String? userId;

  SendOtpPayload({
    this.userId,
    this.type
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "user_id": userId
    };
  }

  SendOtpPayload copyWith({
    String? type,
    String? userId
  }) {
    return SendOtpPayload(
      userId: userId ?? this.userId,
      type: type ?? this.type
    );
  }
}