class AuthEntity {
  late String? token;

  AuthEntity({
    this.token
  });

  AuthEntity copyWith({
    String? token
  }) {
    return AuthEntity(
      token: token ?? this.token
    );
  }
}