// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String token;
  @JsonKey(name: "data")
  UserData? userData;

  SignUpResponse({
    required this.token,
    this.userData,
  });

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String email;
  @JsonKey(name: "_id")
  final String id;
  final String name;

  UserData({required this.email, required this.id, required this.name});

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
