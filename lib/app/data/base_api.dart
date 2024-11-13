

import '../../common/utils/sp_util.dart';

///------------------
/// 打包信息，打包时需要修改
const kReleaseVersion = false;
const kAppVersion = '1.2.7';
const kAppBuild = '21';

/// 展示index
int presentCount = 0;

///------------------
const kBaseUrlLocalKey = 'base_url_local_key';

class BaseApi {
  // 测试环境
  static const String kBaseUrlTest = 'http://175.27.138.121:8088/api';

  // 生产环境
  static const String kBaseUrlDis = 'http://175.27.138.121:8088/api';



  // 实名认证 支付相关
  static const String kPayUrl = 'http://test.yuanyushuzi.cn';
  static String get baseUrl {
    String url = SpUtil.getString(kBaseUrlLocalKey) ?? '';
    if (url.isEmpty) {
      url = kBaseUrlDis;
      setBaseUrl(url);
    }
    return url;
  }

  static setBaseUrl(String url) {
    SpUtil.putString(kBaseUrlLocalKey, url);
  }


  /// 用户协议
  static String get userAgreementUrl => '$baseUrl/#/pages/login/user-agreement';

  /// 隐私权限
  static String get privacyRightsUrl => '$baseUrl/pages/embed/privacy';

}
