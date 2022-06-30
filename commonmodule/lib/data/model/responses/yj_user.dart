/// userId : 62182209.82449293
/// userType : "magna aliqua exercitation velit quis"
/// account : "consequat culpa"
/// name : "est labore id"
/// token : "dolore sint"
/// tokenExpireTime : "occaecat in sunt"
/// userAvatar : "dolore aliquip"
/// isVirtualSchool : "quis est ex in"
/// businessRoleVoList : [{"name":"non ut laborum labore nulla","code":"deserunt aute ullamco","description":"fugiat","businessType":"incididunt","userCount":"officia eiusmod consectetur ut mollit","sort":"cillum deserunt aliqua aute"},{"name":"do culpa","code":"in deserunt cupidatat laborum sed","description":"esse consequat cupidatat nisi","businessType":"nostrud","userCount":"occaecat aute reprehenderit adipisicing","sort":"Duis eu ut"},{"name":"culpa Excepteur","code":"enim","description":"Lorem in","businessType":"veniam velit","userCount":"minim eu in Lorem cillum","sort":"reprehenderit voluptate laboris"}]
/// teacherTeachInfoVoList : [{"userId":"do","teacherRole":"mollit in dolore","roleCode":"id voluptate aute deserunt ut","roleName":"ea adipisicing dolore amet occaecat","name":"voluptate minim magna","stageCode":"sit Excepteur mollit ullamco aliqua","stageName":"sed proident ullamco esse","subjectCode":"commodo in ad","subjectName":"pariatur aliqua","gradeCode":"qui mollit ad deserunt sed","gradeName":"magna veniam commodo reprehenderit ut","classesCode":"in nulla sint","classesName":"proident reprehenderit amet dolor Duis"}]
/// isVirtualSuperAdmin : true

class YjUser {
  YjUser({
    this.userId,
    this.userType,
    this.account,
    this.name,
    this.token,
    this.tokenExpireTime,
    this.userAvatar,
    this.isVirtualSchool,
    this.businessRoleVoList,
    this.dataId,
    this.schoolName,
    this.teacherTeachInfoVoList,
    this.userSchoolVoList,
    this.isVirtualSuperAdmin,
    this.identityTypes,
    this.identityId
  });

  YjUser.fromJson(dynamic json) {
    userId = json['userId'] as int?;
    userType = json['userType'];
    account = json['account'];
    name = json['name'];
    token = json['token'];
    tokenExpireTime = json['tokenExpireTime'] as int?;
    userAvatar = json['userAvatar'];
    isVirtualSchool = json['isVirtualSchool'];
    dataId = json['dataId'] as int?;
    schoolName = json['schoolName'];
    if (json['businessRoleVoList'] != null) {
      businessRoleVoList = [];
      json['businessRoleVoList'].forEach((v) {
        businessRoleVoList?.add(BusinessRoleVoList.fromJson(v));
      });
    }
    if (json['teacherTeachInfoVoList'] != null) {
      teacherTeachInfoVoList = [];
      json['teacherTeachInfoVoList'].forEach((v) {
        teacherTeachInfoVoList?.add(TeacherTeachInfoVoList.fromJson(v));
      });
    }
    if (json['userSchoolVoList'] != null) {
      userSchoolVoList = [];
      json['userSchoolVoList'].forEach((v) {
        userSchoolVoList?.add(UserSchoolVoList.fromJson(v));
      });
    }
    isVirtualSuperAdmin = json['isVirtualSuperAdmin'];
    if (json['identityTypes'] != null){
      identityTypes = [];
      json['identityTypes'].forEach((v) {
        identityTypes?.add(v);
      });
    }
    identityId = json['identityId'] as int?;
  }

  int? userId;
  String? userType;
  String? account;
  String? name;
  String? token;
  int? tokenExpireTime;
  String? userAvatar;
  String? isVirtualSchool;
  List<BusinessRoleVoList>? businessRoleVoList;
  List<TeacherTeachInfoVoList>? teacherTeachInfoVoList;
  List<UserSchoolVoList>? userSchoolVoList;
  bool? isVirtualSuperAdmin;
  int? dataId;
  String? schoolName;
  List<int>? identityTypes;
  int? identityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userType'] = userType;
    map['account'] = account;
    map['name'] = name;
    map['token'] = token;
    map['tokenExpireTime'] = tokenExpireTime;
    map['userAvatar'] = userAvatar;
    map['dataId'] = dataId;
    map['schoolName'] = schoolName;
    map['isVirtualSchool'] = isVirtualSchool;
    if (businessRoleVoList != null) {
      map['businessRoleVoList'] =
          businessRoleVoList?.map((v) => v.toJson()).toList();
    }
    if (teacherTeachInfoVoList != null) {
      map['teacherTeachInfoVoList'] =
          teacherTeachInfoVoList?.map((v) => v.toJson()).toList();
    }
    if (userSchoolVoList != null) {
      map['userSchoolVoList'] =
          userSchoolVoList?.map((v) => v.toJson()).toList();
    }
    map['isVirtualSuperAdmin'] = isVirtualSuperAdmin;
    if(identityTypes != null){
      map['identityTypes'] =
          identityTypes?.map((v) => v).toList();
    }
    map['identityId'] = identityId;
    return map;
  }

  @override
  String toString() {
    return 'YjUser{userId: $userId, userType: $userType, account: $account, name: $name, token: $token, tokenExpireTime: $tokenExpireTime, userAvatar: $userAvatar, isVirtualSchool: $isVirtualSchool, businessRoleVoList: $businessRoleVoList, teacherTeachInfoVoList: $teacherTeachInfoVoList, isVirtualSuperAdmin: $isVirtualSuperAdmin, dataId: $dataId, schoolName: $schoolName, identityTypes:$identityTypes}';
  }
}

/// userId : "do"
/// teacherRole : "mollit in dolore"
/// roleCode : "id voluptate aute deserunt ut"
/// roleName : "ea adipisicing dolore amet occaecat"
/// name : "voluptate minim magna"
/// stageCode : "sit Excepteur mollit ullamco aliqua"
/// stageName : "sed proident ullamco esse"
/// subjectCode : "commodo in ad"
/// subjectName : "pariatur aliqua"
/// gradeCode : "qui mollit ad deserunt sed"
/// gradeName : "magna veniam commodo reprehenderit ut"
/// classesCode : "in nulla sint"
/// classesName : "proident reprehenderit amet dolor Duis"

class TeacherTeachInfoVoList {
  TeacherTeachInfoVoList({
    this.userId,
    this.teacherRole,
    this.roleCode,
    this.roleName,
    this.name,
    this.stageCode,
    this.stageName,
    this.subjectCode,
    this.subjectName,
    this.gradeCode,
    this.gradeName,
    this.classesCode,
    this.classesName,
  });

  TeacherTeachInfoVoList.fromJson(dynamic json) {
    userId = json['userId'];
    teacherRole = json['teacherRole'];
    roleCode = json['roleCode'];
    roleName = json['roleName'];
    name = json['name'];
    stageCode = json['stageCode'];
    stageName = json['stageName'];
    subjectCode = json['subjectCode'];
    subjectName = json['subjectName'];
    gradeCode = json['gradeCode'];
    gradeName = json['gradeName'];
    classesCode = json['classesCode'];
    classesName = json['classesName'];
  }

  int? userId;
  String? teacherRole;
  String? roleCode;
  String? roleName;
  String? name;
  String? stageCode;
  String? stageName;
  String? subjectCode;
  String? subjectName;
  String? gradeCode;
  String? gradeName;
  String? classesCode;
  String? classesName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['teacherRole'] = teacherRole;
    map['roleCode'] = roleCode;
    map['roleName'] = roleName;
    map['name'] = name;
    map['stageCode'] = stageCode;
    map['stageName'] = stageName;
    map['subjectCode'] = subjectCode;
    map['subjectName'] = subjectName;
    map['gradeCode'] = gradeCode;
    map['gradeName'] = gradeName;
    map['classesCode'] = classesCode;
    map['classesName'] = classesName;
    return map;
  }
}

/// name : "non ut laborum labore nulla"
/// code : "deserunt aute ullamco"
/// description : "fugiat"
/// businessType : "incididunt"
/// userCount : "officia eiusmod consectetur ut mollit"
/// sort : "cillum deserunt aliqua aute"

class BusinessRoleVoList {
  BusinessRoleVoList({
    this.name,
    this.code,
    this.description,
    this.businessType,
    this.userCount,
    this.sort,
  });

  BusinessRoleVoList.fromJson(dynamic json) {
    name = json['name'];
    code = json['code'];
    description = json['description'];
    businessType = json['businessType'];
    userCount = json['userCount'];
    sort = json['sort'];
  }

  String? name;
  String? code;
  String? description;
  String? businessType;
  String? userCount;
  String? sort;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['code'] = code;
    map['description'] = description;
    map['businessType'] = businessType;
    map['userCount'] = userCount;
    map['sort'] = sort;
    return map;
  }
}

class UserSchoolVoList {
  UserSchoolVoList({
    this.dataId,
    this.schoolName,
    this.createdTime,
  });

  UserSchoolVoList.fromJson(dynamic json) {
    dataId = json['dataId'];
    schoolName = json['schoolName'];
    createdTime = json['createdTime'];
  }

  int? dataId;
  String? schoolName;
  String? createdTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dataId'] = dataId;
    map['schoolName'] = schoolName;
    map['createdTime'] = createdTime;
    return map;
  }
}
