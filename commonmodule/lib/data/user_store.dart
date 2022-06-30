// ignore: implementation_imports
import 'dart:convert';

import 'package:commonmodule/store/i_store.dart';
import 'package:commonmodule/store/sp_store.dart';

// import 'package:flutter_base_lib/src/tools/store/mmkv_store.dart';
// import 'package:mmkv/mmkv.dart';

class UserStore {
  // late MMKV _iStore;
  static final String headerToken = 'Authorization';
  static final String headerIdentity = 'identityId';
  static final String mmkvName = 'mmkv_user';
  static final String localUidN = 'localUid';

  static final String userTokenN = 'userToken';
  static final String userTokenExpireTimeN = 'userTokenExpireTime';
  static final String userIdN = 'userId';
  static final String userNameN = 'userName';
  static final String userAvatarN = 'userAvatar';
  static final String accountNameN = 'accountName';
  static final String schoolIdN = 'schoolId';
  static final String schoolListN = 'schoolListN';
  static final String schoolNameN = 'schoolName';
  static final String businessRoleN = 'businessRole';
  // static final String showAgreementN = 'showAgreement';
  static final String userNaviTips = 'userNaviTips';
  /// 角色类别 1 教师，2 家长 其他 学生
  static final String identityType = 'identityType';
  static final String studentName = 'studentName';
  static final String studentId = 'studentId';
  static final String hotLine = 'hotLine';
  late IStore _iStore;

  UserStore._internal() {
    // _iStore = MMKVStore.appMMKV(name: mmkvName);
    _iStore = SpSotre.instance;
  }

  static final UserStore _userStore = UserStore._internal();

  factory UserStore() => _userStore;

  //  putShowAgreement(bool hasShowAgreement) {
  //    _iStore.setBool(showAgreementN, hasShowAgreement);
  // }

   putUserToken(String token) {
     _iStore.setString(userTokenN, token);
  }

   putUserTokenExpireTime(int time) {
     _iStore.setInt(userTokenExpireTimeN, time);
  }

   putUserId(int id) {
     _iStore.setInt(userIdN, id);
  }

   putUserName(String name) {
     _iStore.setString(userNameN, name);
  }

   putUserAvatar(String avatar) {
     _iStore.setString(userAvatarN, avatar);
  }

   putAccountName(String account) {
     _iStore.setString(accountNameN, account);
  }

   putSchoolList(String schoolListJson) {
     _iStore.setString(schoolListN, schoolListJson);
  }

   putSchoolName(String school) {
     _iStore.setString(schoolNameN, school);
  }

   putBusinessRole(String businessRole){
     _iStore.setString(businessRoleN, businessRole);
  }

   putLocalUid(String uid) {
     _iStore.setString(localUidN, uid);
  }

  putIdentityType(int identityTypeValue){
     _iStore.setInt(identityType, identityTypeValue);
  }

  putStudentName(String name){
     _iStore.setString(studentName,name);
  }

  putStudentId(int studentIdStr){
     _iStore.setInt(studentId, studentIdStr);
  }

  putHotLine(String hotLineStr){
     _iStore.setString(hotLine, hotLineStr);
  }

  String? getLocalUid(){
    return _iStore.getString(localUidN);
  }

  int getUserTokenExpireTime() {
    return _iStore.getInt(userTokenExpireTimeN)??0;
  }

  String? getUserToken() {
    return _iStore.getString(userTokenN);
  }

  int? getUserId() {
    return _iStore.getInt(userIdN);
  }

  String? getUserName() {
    return _iStore.getString(userNameN);
  }

  String? getUserAvatar() {
    return _iStore.getString(userAvatarN);
  }

  String? getAccountName() {
    return _iStore.getString(accountNameN);
  }

  String? getSchoolName() {
    return _iStore.getString(schoolNameN);
  }

  String? getSchoolList() {
    return _iStore.getString(schoolListN);
  }

  String? getBusinessRole(){
    return _iStore.getString(businessRoleN);
  }

  int? getIdentityType(){
     return _iStore.getInt(identityType)??0;
  }

  String? getStudentName(){
     return _iStore.getString(studentName);
  }

  int? getStudentId(){
     return _iStore.getInt(studentId);
  }

  String? getHotLine(){
     return _iStore.getString(hotLine);
  }

  // bool getShowAgreement(){
  //   return _iStore.getBool(showAgreementN)??false;
  // }

  clearUser(){
    _iStore.remove(userTokenN);
    _iStore.remove(userTokenExpireTimeN);
    _iStore.remove(userIdN);
    _iStore.remove(userNameN);
    _iStore.remove(userAvatarN);
    _iStore.remove(accountNameN);
    _iStore.remove(schoolNameN);
    _iStore.remove(businessRoleN);
    _iStore.remove(identityType);
    _iStore.remove(studentName);
    _iStore.remove(studentId);
    // _iStore.remove(hotLine);
  }

  bool hasUserToken() {
    return _iStore.hasKey(userTokenN);
  }

  void setNaviTipsShowing(bool showing) {
    _iStore.setBool('$userNaviTips/${_userStore.getUserId()}', showing);
  }

  bool isShowingNaviTips() {
    return _iStore.getBool('$userNaviTips/${_userStore.getUserId()}')??true;
  }

  onLogout() {
    // BlocProvider.of<AuthenticationBloc>(LibRouteNavigatorObserver.instance.navigator!.context).add(LogOut());
  }
}
