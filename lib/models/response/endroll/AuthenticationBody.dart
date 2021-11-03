class AuthenticationBody {
  String? access_token;
  String? authentication_type;

//<editor-fold desc="Data Methods">

  AuthenticationBody({
    this.access_token,
    this.authentication_type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationBody &&
          runtimeType == other.runtimeType &&
          access_token == other.access_token &&
          authentication_type == other.authentication_type);

  @override
  int get hashCode => access_token.hashCode ^ authentication_type.hashCode;

  @override
  String toString() {
    return 'AuthenticationBody{' +
        ' access_token: $access_token,' +
        ' authentication_type: $authentication_type,' +
        '}';
  }

  AuthenticationBody copyWith({
    String? access_token,
    String? authentication_type,
  }) {
    return AuthenticationBody(
      access_token: access_token ?? this.access_token,
      authentication_type: authentication_type ?? this.authentication_type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': this.access_token,
      'authentication_type': this.authentication_type,
    };
  }

  factory AuthenticationBody.fromMap(Map<String, dynamic> map) {
    return AuthenticationBody(
      access_token: map['access_token'] as String,
      authentication_type: map['authentication_type'] as String,
    );
  }

//</editor-fold>
}
