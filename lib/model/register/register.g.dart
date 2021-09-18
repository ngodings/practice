// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['email'] as String,
    json['username'] as String,
    json['password'] as String,
    json['confrimPassword'] as String,
    json['fullName'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'confrimPassword': instance.confrimPassword,
      'fullName': instance.fullName,
      'phone': instance.phone,
    };
