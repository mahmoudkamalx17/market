import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;

  SignUpRequestBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirm});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);
}
