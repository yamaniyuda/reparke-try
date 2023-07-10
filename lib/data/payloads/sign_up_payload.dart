import 'package:image_picker/image_picker.dart';
import 'package:reparke/data/payloads/payload.dart';

class SignUpPayload extends Payload {
  final String? fullName;
  final String? noKtp;
  final String? noPassport;
  final String? email;
  final String? pin;
  final String? identityType;
  final XFile? image;

  SignUpPayload({
    this.email,
    this.image,
    this.pin,
    this.fullName,
    this.identityType,
    this.noKtp,
    this.noPassport
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "no_ktp": noKtp,
      "no_passport": noPassport,
      "email": email,
      "pin": pin,
      "identity_type": identityType
    };
  }

  SignUpPayload copyWith({
    String? fullName,
    String? noKtp,
    String? noPassport,
    String? email,
    String? pin,
    String? identityType,
    XFile? image,
  }) {
    return SignUpPayload(
      pin: pin ?? this.pin,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      identityType: identityType ?? this.identityType,
      noKtp: noKtp ?? this.noKtp,
      noPassport: noPassport ?? this.noPassport,
      image: image ?? this.image
    );
  }
}