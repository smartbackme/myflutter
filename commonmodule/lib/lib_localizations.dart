//
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class LibLocalizations {
//
//   final Locale locale;
//
//   LibLocalizations(this.locale);
//
//   Map<String, LibString> values = {
//     'en': EnLibString(),
//     'zh': ChLibString(),
//     'ja': JpLibString(),
//   };
//
//   LibString? get currentLocalization {
//     if (values.containsKey(locale.languageCode)) {
//       return values[locale.languageCode];
//     }
//     return values["en"];
//   }
//
//   static const LibLocalizationsDelegate delegate = LibLocalizationsDelegate();
//
//   //为了使用方便，我们定义一个静态方法
//   static LibLocalizations? of(BuildContext context) {
//     return Localizations.of<LibLocalizations>(context, LibLocalizations);
//   }
//
//   static LibString getLibString({BuildContext? context}) {
//     if(context==null){
//       context =
//     }
//     assert(context!=null,"context is not null");
//     return Localizations.of<LibLocalizations>(context!, LibLocalizations)?.currentLocalization??EnLibString();
//   }
//
//
// }
//
//
// class LibLocalizationsDelegate extends LocalizationsDelegate<LibLocalizations> {
//
//   const LibLocalizationsDelegate();
//   ///是否支持某个Local
//   @override
//   bool isSupported(Locale locale) {
//     return [
//       'en',
//       'zh',
//       'ja',
//     ].contains(locale.languageCode);
//   }
// /// Flutter会调用此类加载相应的Locale资源类
//   @override
//   Future<LibLocalizations> load(Locale locale) {
//     return SynchronousFuture<LibLocalizations>(
//         LibLocalizations(locale));
//   }
//
//   ///shouldReload的返回值决定当Localizations组件重新build时，
//   ///是否调用load方法重新加载Locale资源。一般情况下，
//   ///Locale资源只应该在Locale切换时加载一次，
//   ///不需要每次在Localizations重新build时都加载，
//   ///所以返回false即可。可能有些人会担心返回false的话在APP
//   ///启动后用户再改变系统语言时load方法将不会被调用，所以Locale资源将不会被加载。
//   ///事实上，每当Locale改变时Flutter都会再调用load方法加载新的Locale，
//   ///无论shouldReload返回true还是false。
//   @override
//   bool shouldReload(covariant LocalizationsDelegate<LibLocalizations> old) => false;
//
// }
//
//
//
// abstract class LibString {
//
//   String? libNetRequestCancel;
//
//   String? libNetFailCheck;
//
//   String? libNetTimeOutCheck;
//
//   String? libNetResponseTimeOut;
//
//   String? libNetServerError;
//
//   String? libNetDataError;
//
//   String? libNetWorkError;
//
//   String? libNetWorkNoConnect;
//
//   String? libSpaceDoesNotExist;
//   String? libInsufficientStorageSpace;
//   String? libInsufficientStorageWarning;
//   String? libBussinessTokenTimeOut;
//   String? libBussinessRequestCodeError;
//
// }
//
// /// Simplified Chinese
// class ChLibString implements LibString {
//
//   @override
//   String? libNetFailCheck = "网络请求失败,请检查";
//
//   @override
//   String? libNetRequestCancel = "请求取消";
//
//   @override
//   String? libNetResponseTimeOut = "服务器响应超时";
//
//   @override
//   String? libNetServerError = "服务器错误";
//
//   @override
//   String? libNetTimeOutCheck = "网络请求超时,请检查";
//
//   @override
//   String? libInsufficientStorageSpace = "存储空间不足";
//
//   @override
//   String? libInsufficientStorageWarning = "存储空间不足警告";
//
//   @override
//   String? libSpaceDoesNotExist = "存储空间不存在";
//
//   @override
//   String? libNetWorkError = "网络错误，请检查网络";
//
//   @override
//   String? libBussinessRequestCodeError = "请求错误";
//
//   @override
//   String? libBussinessTokenTimeOut = "token 失效";
//
//   @override
//   String? libNetWorkNoConnect = "当前网络不可用，请检查您的网络";
//
//   @override
//   String? libNetDataError = "数据异常";
//
// }
//
// // /// Traditional Chinese
// // class TChLibString implements LibString {
// //   @override
// //   String? libDebugConsole = "調試模式：在開發階段，為了調試及測試方便，提供測試階段的環境切換，此頁面發佈後的線上環境不顯示。";
// //
// //   @override
// //   String? libDebugInterception = "控制台";
// //
// //   @override
// //   String? libDebugModeIntroduce = "網絡攔截";
// //
// // }
//
// /// English
// class EnLibString implements LibString {
//
//   @override
//   String? libNetFailCheck = "Network request failed, please check";
//
//   @override
//   String? libNetRequestCancel = "Request cancellation";
//
//   @override
//   String? libNetResponseTimeOut = "Server response timeout";
//
//   @override
//   String? libNetServerError = "Server error";
//
//   @override
//   String? libNetTimeOutCheck = "Network request timed out, please check";
//
//   @override
//   String? libInsufficientStorageSpace = "Insufficient storage space";
//
//   @override
//   String? libInsufficientStorageWarning = "Insufficient storage warning";
//
//   @override
//   String? libSpaceDoesNotExist = "Storage space does not exist";
//
//
//   @override
//   String? libNetWorkError = "Network error, please check the network";
//
//
//   @override
//   String? libBussinessRequestCodeError = "Request Error";
//
//   @override
//   String? libBussinessTokenTimeOut = "Token invalid";
//
//
//   @override
//   String? libNetWorkNoConnect = "The current network is unavailable. Please check your network";
//
//   @override
//   String? libNetDataError = "Data exception";
//
// }
//
// /// Japanese
// class JpLibString implements LibString {
//
//   @override
//   String? libNetFailCheck = "ネットワークリクエストに失敗しました。確認してください。";
//
//   @override
//   String? libNetRequestCancel = "キャンセルの要求";
//
//   @override
//   String? libNetResponseTimeOut = "サーバレスポンスタイムアウト";
//
//   @override
//   String? libNetServerError = "サーバエラー";
//
//   @override
//   String? libNetTimeOutCheck = "ネットワークリクエストがタイムアウトしました。確認してください。";
//
//   @override
//   String? libInsufficientStorageSpace = "ストレージ容量不足";
//
//   @override
//   String? libInsufficientStorageWarning = "ストレージ容量不足の警告";
//
//   @override
//   String? libSpaceDoesNotExist = "ストレージスペースが存在しません";
//
//   @override
//   String? libNetWorkError = "ネットワークエラー、ネットワークを確認してください";
//
//   @override
//   String? libBussinessRequestCodeError = "リクエスト エラー";
//
//   @override
//   String? libBussinessTokenTimeOut = "token 効力を失う";
//
//   @override
//   String? libNetWorkNoConnect = "現在のネットワークは使用できません。ネットワークを確認してください。";
//
//   @override
//   String? libNetDataError = "データ異常";
//
// }