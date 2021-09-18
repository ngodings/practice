import 'package:json_annotation/json_annotation.dart';
import 'package:practice/model/diagnostic/diagnostic.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  late Diagnostic diagnostic;
  late List<ItemUser> users;
  @JsonKey(ignore: true)
  late String error;

  User(this.diagnostic, this.users);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User.withError(this.error);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{diagnostic: $diagnostic, users: $users}';
  }
}

@JsonSerializable()
class ItemUser {
  String username;
  String email;
  String password;
  String confrimPassword;
  String fullName;
  String phone;

  ItemUser(this.username, this.email, this.password, this.confrimPassword,
      this.fullName, this.phone);

  factory ItemUser.fromJson(Map<String, dynamic> json) =>
      _$ItemUserFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUserToJson(this);

  @override
  String toString() {
    return 'ItemUser{email: $email, username: $username, password: $password, confrimPassword: $confrimPassword, fullName: $fullName, phone: $phone}';
  }
}
