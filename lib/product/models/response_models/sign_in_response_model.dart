import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable(createToJson: false)
final class SignInResponseModel {
  SignInResponseModel(this.token, this.email, this.userName);

  final String token;
  final String email;
  final String userName;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
