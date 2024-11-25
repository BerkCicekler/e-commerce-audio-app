import 'package:json_annotation/json_annotation.dart';

part 'oauth_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class OAuthRequestModel {
  OAuthRequestModel(this.oAuthId, this.userName, this.email);

  final String oAuthId;
  final String userName;
  final String email;

  Map<String, dynamic> toJson() => _$OAuthRequestModelToJson(this);
}
