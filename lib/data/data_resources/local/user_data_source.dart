import 'package:reparke/data/data_resources/local/local_data_source.dart';
import 'package:reparke/data/dtos/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataSource extends LocalDataSource {

  final String _keyUser = "user_data_local";

  Future<UserDTO> storeUser(UserDTO data) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (await getUser() != null) {
      await deleteUser();
    }
    await storage.setString(_keyUser, data.serialize());
    final UserDTO? dataLocal = await getUser();
    return dataLocal!;
  }

  Future<UserDTO?> getUser() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final String? dataLocal = storage.getString(_keyUser);
    return (dataLocal == null) ? null : UserDTO.deserialize(dataLocal);
  }

  Future<void> deleteUser() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(_keyUser);
  }
}