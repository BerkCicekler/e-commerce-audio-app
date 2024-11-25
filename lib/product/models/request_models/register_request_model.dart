import 'package:json_annotation/json_annotation.dart';
part 'register_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class RegisterRequestModel {
  RegisterRequestModel(this.userName, this.email, this.password);

  final String userName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
