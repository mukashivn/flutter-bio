class BaseResponse<T> {
  String code;
  String message;
  String system_message;
  T data;

  BaseResponse(this.code, this.message, this.system_message, this.data);

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
      json['code'], json['message'], json['system_message'], json['data']);
}
