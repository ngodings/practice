import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'access_token')
  late String accessToken;
  @JsonKey(name: 'token_type')
  late String tokenType;
  @JsonKey(name: 'refresh_token')
  late String refreshToken;
  @JsonKey(name: 'expires_in')
  late int expiresIn;
  late String scope;
  @JsonKey(ignore: true)
  late String error;

  Token(this.accessToken, this.tokenType, this.refreshToken, this.expiresIn,
      this.scope);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Token.withError(this.error);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  String toString() {
    return 'Token{accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, scope: $scope}';
  }
}
