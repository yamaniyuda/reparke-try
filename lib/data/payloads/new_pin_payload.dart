import 'dart:math';

import 'package:reparke/data/payloads/payload.dart';

class NewPinPayload extends Payload {
  final String? pin;

  NewPinPayload({
    this.pin
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "pin": pin
    };
  }

  NewPinPayload copyWith({
    String? pin
  }) {
    return NewPinPayload(
      pin: pin ?? this.pin
    );
  }
}