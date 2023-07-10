  import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
  import 'package:reparke/data/dtos/dto.dart';

  part 'user_dto.g.dart';

  @JsonSerializable()
  class UserDTO implements DTO {
    @JsonKey(name: "user_id")
    late String? userId;

    @JsonKey(name: "full_name")
    late String? fullName;

    @JsonKey(name: "email")
    late String? email;

    @JsonKey(name: "no_telp")
    late String? noTelp;

    @JsonKey(name: "verified")
    late bool? verified;

    @JsonKey(name: "ktp_image")
    late String? ktpImage;

    @JsonKey(name: "passport_image")
    late String? passportImage;

    @JsonKey(name: "otp")
    late String? otp;

    UserDTO({
      this.userId,
      this.email,
      this.otp,
      this.fullName,
      this.verified,
      this.ktpImage,
      this.noTelp,
      this.passportImage
    });

    factory UserDTO.fromJson(Map<String, dynamic> json) {
      return _$UserDTOFromJson(json);
    }

    factory UserDTO.deserialize(String json) {
      return UserDTO.fromJson(jsonDecode(json));
    }

    @override
    Map<String, dynamic> toJson() {
      return _$UserDTOToJson(this);
    }

    String serialize() {
      return jsonEncode(toJson());
    }
  }