import 'package:boilerplate/models/common/BaseResponse.dart';
import 'package:boilerplate/models/response/endroll/LoginResponseBody.dart';

class LoginResponse extends BaseResponse<LoginResponseBody> {
  // LoginResponse(String code, String message, String system_message,
  //     LoginResponseBody data)
  //     : super(
  //           code: code,
  //           message: message,
  //           system_message: system_message,
  //           data: data);

  // factory LoginResponse.fromMap(Map<String, dynamic> map) {
  //   return LoginResponse(map['code'] as String, map['messsage'] as String,
  //       map['system_message'] as String, map['data'] as LoginResponseBody);
  // }
}
