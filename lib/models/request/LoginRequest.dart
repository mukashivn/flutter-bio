class LoginRequest {
  String client_version;
  String password;
  String username;
  String? firebase_token;
  String client_os;

//<editor-fold desc="Data Methods">

  LoginRequest({
    required this.client_version,
    required this.password,
    required this.username,
    this.firebase_token,
    required this.client_os,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginRequest &&
          runtimeType == other.runtimeType &&
          client_version == other.client_version &&
          password == other.password &&
          username == other.username &&
          firebase_token == other.firebase_token &&
          client_os == other.client_os);

  @override
  int get hashCode =>
      client_version.hashCode ^
      password.hashCode ^
      username.hashCode ^
      firebase_token.hashCode ^
      client_os.hashCode;

  @override
  String toString() {
    return 'LoginRequest{' +
        ' client_version: $client_version,' +
        ' password: $password,' +
        ' username: $username,' +
        ' firebase_token: $firebase_token,' +
        ' client_os: $client_os,' +
        '}';
  }

  LoginRequest copyWith({
    String? client_version,
    String? password,
    String? username,
    String? firebase_token,
    String? client_os,
  }) {
    return LoginRequest(
      client_version: client_version ?? this.client_version,
      password: password ?? this.password,
      username: username ?? this.username,
      firebase_token: firebase_token ?? this.firebase_token,
      client_os: client_os ?? this.client_os,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'client_version': this.client_version,
      'password': this.password,
      'username': this.username,
      'firebase_token': this.firebase_token,
      'client_os': this.client_os,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      client_version: map['client_version'] as String,
      password: map['password'] as String,
      username: map['username'] as String,
      firebase_token: map['firebase_token'] as String,
      client_os: map['client_os'] as String,
    );
  }

//</editor-fold>
}