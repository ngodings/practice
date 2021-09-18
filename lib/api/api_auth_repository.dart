import 'package:practice/api/api_auth_provider.dart';
import 'package:practice/model/diagnostic/diagnostic.dart';
import 'package:practice/model/login/login_body.dart';
import 'package:practice/model/refreshtoken/refresh_token_body.dart';
import 'package:practice/model/register/register.dart';
import 'package:practice/model/token/token.dart';
import 'package:practice/model/usr/user.dart';

class ApiAuthRepository {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<Diagnostic> postRegisterUser(Register register) =>
      _apiAuthProvider.registerUser(register);

  Future<Token> postLoginUser(LoginBody loginBody) =>
      _apiAuthProvider.loginUser(loginBody);

  Future<Token> postRefreshAuth(RefreshTokenBody refreshTokenBody) =>
      _apiAuthProvider.refreshAuth(refreshTokenBody);

  Future<User> fetchAllUsers() => _apiAuthProvider.getAllUsers();
}
