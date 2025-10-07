class OtpModel {
//رقم الفون بتاع المستخدم
final String phoneNumber;


// الكود نفسه كسلسلة (مثال: "123456")
final String code;


// وقت انتهاء صلاحية الكود
final DateTime expiresAt;


OtpModel({
required this.phoneNumber,
required this.code,
required this.expiresAt,
});


// تحويل الكائن إلى JSON قبل وضعه في Firestore
Map<String, dynamic> toJson() => {
'phoneNumber': phoneNumber,
'code': code,
'expiresAt': expiresAt.toIso8601String(),
};


// بناء الكائن من JSON المقروء من Firestore
factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
phoneNumber: json['phoneNumber'] as String,
code: json['code'] as String,
expiresAt: DateTime.parse(json['expiresAt'] as String),
);
}