abstract class DTO {
  DTO();
  factory DTO.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
  Map<String, dynamic> toJson();
}