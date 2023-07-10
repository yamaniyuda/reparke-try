import 'package:reparke/data/data_resources/local/local_data_source.dart';
import 'package:reparke/data/dtos/auth_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource extends LocalDataSource {

  final String _keyAuth = "auth_token";

  Future<AuthDTO> storeAuth(AuthDTO data) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (await getAuth() != null) {
      await deleteAuth();
    }
    await storage.setString(_keyAuth, data.serialize());
    final AuthDTO? dataLocal = await getAuth();
    return dataLocal!;
  }

  Future<AuthDTO?> getAuth() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final String? dataLocal = storage.getString(_keyAuth);
    return (dataLocal == null) ? null : AuthDTO.deserialize(dataLocal);
  }

  Future<String> getToken() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final AuthDTO? data = await getAuth();
    final String token = data?.token ?? "";
    return "Bearer $token";
  }

  Future<void> deleteAuth() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(_keyAuth);
  }
}