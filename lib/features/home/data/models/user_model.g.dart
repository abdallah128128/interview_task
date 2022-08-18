// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      role_id: json['role_id'] as String?,
      user_name: json['user_name'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      country_code: json['country_code'] as String?,
      language: json['language'] as String?,
      language_name: json['language_name'] as String?,
      language_code: json['language_code'] as String?,
      profileImage: json['profileImage'] as String?,
      viewSettings: json['viewSettings'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'role_id': instance.role_id,
      'user_name': instance.user_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'country': instance.country,
      'country_code': instance.country_code,
      'language': instance.language,
      'language_name': instance.language_name,
      'language_code': instance.language_code,
      'profileImage': instance.profileImage,
      'viewSettings': instance.viewSettings,
    };
