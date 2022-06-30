
class TestLoginParams {
  final String account;
  final String password;
  final String identityType; /// 1 教师，2 家长

  TestLoginParams(this.account, this.password, this.identityType);

  factory TestLoginParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TestLoginParamsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TestLoginParamsToJson(this);

}

TestLoginParams _$TestLoginParamsFromJson(Map<String, dynamic> json) {
  return TestLoginParams(
    json['account'] as String,
    json['password'] as String,
    json['identityType'] as String,
  );
}

Map<String, dynamic> _$TestLoginParamsToJson(TestLoginParams instance) =>
    <String, dynamic>{
      'account': instance.account,
      'password': instance.password,
      'identityType': instance.identityType,
    };
