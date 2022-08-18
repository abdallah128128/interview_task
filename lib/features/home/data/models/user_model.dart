
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? role_id;
  String? user_name;
  String? first_name;
  String? last_name;
  String? gender;
  String? phone;
  String? email;
  String? country;
  String? country_code;
  String? language;
  String? language_name;
  String? language_code;
  String? profileImage;
  String? viewSettings;

  UserModel({
    this.id,
    this.role_id,
    this.user_name,
    this.first_name,
    this.last_name,
    this.gender,
    this.phone,
    this.email,
    this.country,
    this.country_code,
    this.language,
    this.language_name,
    this.language_code,
    this.profileImage,
    this.viewSettings,
});




  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
