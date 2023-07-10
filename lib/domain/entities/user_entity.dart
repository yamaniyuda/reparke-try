class UserEntity {
  late String? userId;
  late String? fullName;
  late String? email;
  late String? noTelp;
  late bool? verified;
  late String? ktpImage;
  late String? passportImage;
  late String? otp;

  UserEntity({
    this.userId,
    this.email,
    this.otp,
    this.fullName,
    this.verified,
    this.ktpImage,
    this.noTelp,
    this.passportImage
  });

  UserEntity copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? noTelp,
    bool? verified,
    String? ktpImage,
    String? passportImage,
    String? otp,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      fullName: fullName ?? this.fullName,
      verified: verified ?? this.verified,
      ktpImage: ktpImage ?? this.ktpImage,
      noTelp: noTelp ?? this.noTelp,
      passportImage: passportImage ?? this.passportImage
    );
  }
}