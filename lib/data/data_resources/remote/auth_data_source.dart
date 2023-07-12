import 'package:dio/dio.dart';
import 'package:reparke/data/data_resources/remote/remote_data_source.dart';
import 'package:reparke/data/dtos/auth_dto.dart';
import 'package:reparke/data/dtos/user_dto.dart';
import 'package:reparke/data/payloads/new_pin_payload.dart';
import 'package:reparke/data/payloads/reset_pin_payload.dart';
import 'package:reparke/data/payloads/send_otp_payload.dart';
import 'package:reparke/data/payloads/send_otp_reset_pin_payload.dart';
import 'package:reparke/data/payloads/sign_in_payload.dart';
import 'package:reparke/data/payloads/sign_up_payload.dart';
import 'package:reparke/data/payloads/verify_reset_pin_payload.dart';
import 'package:reparke/data/payloads/verify_sign_up_payload.dart';
import 'package:reparke/helpers/helper.dart';

class AuthDataSource extends RemoteDataSource {
  Future<UserDTO> signUp({ required SignUpPayload payload }) async {
    late Map<String, dynamic> postDataParams = payload.toJson();
    final FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(payload.image!.path, filename: payload.image!.name)
    });

    postDataParams.remove("image");
    final UserDTO response = await dioClient.postRequest(
      "auth/signup?${Helper().mapToString("&", postDataParams)}",
      data: formData,
      converter: (data) => UserDTO.fromJson(data["data"])
    );

    return response;
  }

  Future<String> verifySignUp({ required VerifySignUpPayload payload }) async {
    final String response = await dioClient.postRequest(
      "auth/signup/verify?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => data["message"]
    );

    return response;
  }

  Future<String> sendOTP({ required SendOtpPayload payload }) async {
    final String response = await dioClient.postRequest(
      "auth/send-otp?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => data["message"]
    );

    return response;
  }

  Future<String> sendOTPResetPin({ required SendOTPResetPinPayload payload }) async {
    final String response = await dioClient.postRequest(
      "auth/reset-pin/send-otp?type=email&${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => data["message"]
    );

    return response;
  }

  Future<AuthDTO> signIn({ required SignInPayload payload }) async {
    final AuthDTO response = await dioClient.postRequest(
      "auth/signin?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => AuthDTO.fromJson(data["data"])
    );

    return response;
  }

  Future<AuthDTO> verifyResetPin({ required VerifyResetPinPayload payload }) async {
    final AuthDTO response = await dioClient.postRequest(
      "auth/reset-pin/new?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => AuthDTO.fromJson(data["data"])
    );

    return response;
  }

  Future<String> newPin({ required NewPinPayload payload }) async {
    final String response = await dioClient.postRequest(
      "auth/reset-pin/new?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => data["message"]
    );

    return response;
  }

  Future<String> resetPin({ required ResetPinPayload payload }) async {
    final String response = await dioClient.postRequest(
      "auth/reset-pin?${Helper().mapToString("&", payload.toJson())}",
      data: {},
      converter: (data) => data["message"]
    );
    return response;
  }
}