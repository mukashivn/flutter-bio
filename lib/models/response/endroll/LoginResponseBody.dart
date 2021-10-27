import 'package:boilerplate/models/response/endroll/AuthenticationBody.dart';
import 'package:boilerplate/models/response/endroll/SiginBody.dart';

class LoginResponseBody {
  SignBody signIn_info;
  AuthenticationBody authentication_info;

//<editor-fold desc="Data Methods">

  LoginResponseBody({
    required this.signIn_info,
    required this.authentication_info,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginResponseBody &&
          runtimeType == other.runtimeType &&
          signIn_info == other.signIn_info &&
          authentication_info == other.authentication_info);

  @override
  int get hashCode => signIn_info.hashCode ^ authentication_info.hashCode;

  @override
  String toString() {
    return 'LoginResponseBody{' +
        ' signIn_info: $signIn_info,' +
        ' authentication_info: $authentication_info,' +
        '}';
  }

  LoginResponseBody copyWith({
    SignBody? signIn_info,
    AuthenticationBody? authentication_info,
  }) {
    return LoginResponseBody(
      signIn_info: signIn_info ?? this.signIn_info,
      authentication_info: authentication_info ?? this.authentication_info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'signIn_info': this.signIn_info,
      'authentication_info': this.authentication_info,
    };
  }

  factory LoginResponseBody.fromMap(Map<String, dynamic> map) {
    return LoginResponseBody(
      signIn_info: map['signIn_info'] as SignBody,
      authentication_info: map['authentication_info'] as AuthenticationBody,
    );
  }

//</editor-fold>
}