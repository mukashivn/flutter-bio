import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/models/common/BaseResponse.dart';
import 'package:boilerplate/models/request/LoginRequest.dart';
import 'package:boilerplate/models/response/endroll/LoginResponseBody.dart';

class EndRollApi {
  final DioClient _dioClient;
  final RestClient _restClient;

  //Inject EndrollAPI
  EndRollApi(this._dioClient, this._restClient);

  //Login API
  Future<BaseResponse<LoginResponseBody>> signIn(LoginRequest request) async {
    try {
      final res = await _dioClient.post(Endpoints.LOGIN, data: request.toMap());
      return BaseResponse<LoginResponseBody>.fromMap(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

//Register

//Active OTP

//Forgot pass

}
