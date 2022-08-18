import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel{
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? password;
  String? re_password;
  String? MacAddress;
  String? telephone;


  RegisterModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.password,
    this.re_password,
    this.MacAddress,
    this.telephone,
});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}