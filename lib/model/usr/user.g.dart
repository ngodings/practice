// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    Diagnostic.fromJson(json['diagnostic'] as Map<String, dynamic>),
    (json['users'] as List<dynamic>)
        .map((e) => ItemUser.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'diagnostic': instance.diagnostic,
      'users': instance.users,
    };

ItemUser _$ItemUserFromJson(Map<String, dynamic> json) {
  return ItemUser(
    json['username'] as String,
    json['email'] as String,
    json['password'] as String,
    json['confrimPassword'] as String,
    json['fullName'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$ItemUserToJson(ItemUser instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'confrimPassword': instance.confrimPassword,
      'fullName': instance.fullName,
      'phone': instance.phone,
    };
