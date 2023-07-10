import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:reparke/data/dtos/dto.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDTO implements DTO {
  @JsonKey(name: "token")
  late String? token;

  AuthDTO({
    this.token
  });

  factory AuthDTO.fromJson(Map<String, dynamic> json) {
    return _$AuthDTOFromJson(json);
  }

  factory AuthDTO.deserialize(String json) {
    return AuthDTO.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AuthDTOToJson(this);
  }

  String serialize() {
    return jsonEncode(toJson());
  }
}