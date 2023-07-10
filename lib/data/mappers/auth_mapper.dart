import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:reparke/data/dtos/auth_dto.dart';
import 'package:reparke/domain/entities/auth_entity.dart';

part 'auth_mapper.g.dart';

@AutoMappr([
  MapType<AuthDTO, AuthEntity>(),
  MapType<AuthEntity, AuthDTO>()
])
class AuthMapper extends $AuthMapper {}