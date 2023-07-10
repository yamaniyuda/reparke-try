import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:reparke/data/dtos/user_dto.dart';
import 'package:reparke/domain/entities/user_entity.dart';

part 'user_mapper.g.dart';

@AutoMappr([
  MapType<UserDTO, UserEntity>(),
  MapType<UserEntity, UserDTO>()
])
class UserMapper extends $UserMapper {}