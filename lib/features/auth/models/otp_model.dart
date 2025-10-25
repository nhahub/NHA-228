class OtpModel {
  final String phoneNumber;
  final String code;
  final DateTime expiresAt;

  OtpModel({required this.phoneNumber, required this.code, required this.expiresAt});

  Map<String, dynamic> toJson() => {
    'phoneNumber': phoneNumber,
    'code': code,
    'expiresAt': expiresAt.toIso8601String(),
  };

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    phoneNumber: json['phoneNumber'] as String,
    code: json['code'] as String,
    expiresAt: DateTime.parse(json['expiresAt'] as String),
  );
}
