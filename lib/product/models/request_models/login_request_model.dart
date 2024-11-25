import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class LoginRequestModel {
  LoginRequestModel(this.email, this.password);

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
