class SignBody {
  String address;
  String customer_id;
  String customer_name;
  String customer_mobile;
  String customer_birthday;
  String customer_email;
  String customer_gender;
  String avatar_url;
  String customer_code;

//<editor-fold desc="Data Methods">

  SignBody({
    required this.address,
    required this.customer_id,
    required this.customer_name,
    required this.customer_mobile,
    required this.customer_birthday,
    required this.customer_email,
    required this.customer_gender,
    required this.avatar_url,
    required this.customer_code,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignBody &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          customer_id == other.customer_id &&
          customer_name == other.customer_name &&
          customer_mobile == other.customer_mobile &&
          customer_birthday == other.customer_birthday &&
          customer_email == other.customer_email &&
          customer_gender == other.customer_gender &&
          avatar_url == other.avatar_url &&
          customer_code == other.customer_code);

  @override
  int get hashCode =>
      address.hashCode ^
      customer_id.hashCode ^
      customer_name.hashCode ^
      customer_mobile.hashCode ^
      customer_birthday.hashCode ^
      customer_email.hashCode ^
      customer_gender.hashCode ^
      avatar_url.hashCode ^
      customer_code.hashCode;

  @override
  String toString() {
    return 'SignBody{' +
        ' address: $address,' +
        ' customer_id: $customer_id,' +
        ' customer_name: $customer_name,' +
        ' customer_mobile: $customer_mobile,' +
        ' customer_birthday: $customer_birthday,' +
        ' customer_email: $customer_email,' +
        ' customer_gender: $customer_gender,' +
        ' avatar_url: $avatar_url,' +
        ' customer_code: $customer_code,' +
        '}';
  }

  SignBody copyWith({
    String? address,
    String? customer_id,
    String? customer_name,
    String? customer_mobile,
    String? customer_birthday,
    String? customer_email,
    String? customer_gender,
    String? avatar_url,
    String? customer_code,
  }) {
    return SignBody(
      address: address ?? this.address,
      customer_id: customer_id ?? this.customer_id,
      customer_name: customer_name ?? this.customer_name,
      customer_mobile: customer_mobile ?? this.customer_mobile,
      customer_birthday: customer_birthday ?? this.customer_birthday,
      customer_email: customer_email ?? this.customer_email,
      customer_gender: customer_gender ?? this.customer_gender,
      avatar_url: avatar_url ?? this.avatar_url,
      customer_code: customer_code ?? this.customer_code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': this.address,
      'customer_id': this.customer_id,
      'customer_name': this.customer_name,
      'customer_mobile': this.customer_mobile,
      'customer_birthday': this.customer_birthday,
      'customer_email': this.customer_email,
      'customer_gender': this.customer_gender,
      'avatar_url': this.avatar_url,
      'customer_code': this.customer_code,
    };
  }

  factory SignBody.fromMap(Map<String, dynamic> map) {
    return SignBody(
      address: map['address'] as String,
      customer_id: map['customer_id'] as String,
      customer_name: map['customer_name'] as String,
      customer_mobile: map['customer_mobile'] as String,
      customer_birthday: map['customer_birthday'] as String,
      customer_email: map['customer_email'] as String,
      customer_gender: map['customer_gender'] as String,
      avatar_url: map['avatar_url'] as String,
      customer_code: map['customer_code'] as String,
    );
  }

//</editor-fold>
}
