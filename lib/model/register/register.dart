import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  String username;
  String email;
  String password;
  String confrimPassword;
  String fullName;
  String phone;

  Register(this.email, this.username, this.password, this.confrimPassword,
      this.fullName, this.phone);

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);

  @override
  String toString() {
    return 'Register{email: $email, username: $username, password: $password, confrimPassword: $confrimPassword, fullName: $fullName, phone: $phone}';
  }
}
