class BaseResponse<T> {
  String code;
  String message;
  String system_message;
  T? data;

//<editor-fold desc="Data Methods">

  BaseResponse({
    required this.code,
    required this.message,
    required this.system_message,
    this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseResponse &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message &&
          system_message == other.system_message &&
          data == other.data);

  @override
  int get hashCode =>
      code.hashCode ^
      message.hashCode ^
      system_message.hashCode ^
      data.hashCode;

  @override
  String toString() {
    return 'BaseResponse{' +
        ' code: $code,' +
        ' message: $message,' +
        ' system_message: $system_message,' +
        ' data: $data,' +
        '}';
  }

  BaseResponse copyWith({
    String? code,
    String? message,
    String? system_message,
    T? data,
  }) {
    return BaseResponse(
      code: code ?? this.code,
      message: message ?? this.message,
      system_message: system_message ?? this.system_message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': this.code,
      'message': this.message,
      'system_message': this.system_message,
      'data': this.data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      code: map['code'] as String,
      message: map['message'] as String,
      system_message: map['system_message'] as String,
      data: map['data'] as T,
    );
  }

//</editor-fold>
}
