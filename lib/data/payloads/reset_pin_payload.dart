import 'package:reparke/data/payloads/payload.dart';

class ResetPinPayload extends Payload {
  final String? identity;

  ResetPinPayload({
    this.identity
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "identity": identity
    };
  }

  ResetPinPayload copyWith({
    String? identity
  }) {
    return ResetPinPayload(
      identity: identity ?? this.identity
    );
  }
}