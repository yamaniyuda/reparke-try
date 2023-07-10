// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      userId: json['user_id'] as String?,
      email: json['email'] as String?,
      otp: json['otp'] as String?,
      fullName: json['full_name'] as String?,
      verified: json['verified'] as bool?,
      ktpImage: json['ktp_image'] as String?,
      noTelp: json['no_telp'] as String?,
      passportImage: json['passport_image'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'email': instance.email,
      'no_telp': instance.noTelp,
      'verified': instance.verified,
      'ktp_image': instance.ktpImage,
      'passport_image': instance.passportImage,
      'otp': instance.otp,
    };
