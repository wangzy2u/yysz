
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../app/data/global_service.dart';

class AppUtil{

  // 获取包信息
  static Future<PackageInfo> getPackageInfo() async {
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    return _packageInfo;
  }

  // 获设备信息
  static Future<BaseDeviceInfo> getDeviceInfo() async {
    BaseDeviceInfo _baseDeviceInfo = await DeviceInfoPlugin().deviceInfo;
    return _baseDeviceInfo!;
  }


  // 获取Android SDK Version
  static Future<int?> getAndroidSdkVersion() async {
    if (Platform.isAndroid) {
      BaseDeviceInfo deviceInfo = await getDeviceInfo();
      AndroidDeviceInfo androidDeviceInfo =
      AndroidDeviceInfo.fromMap(deviceInfo.data);
      return androidDeviceInfo.version.sdkInt;
    }
    return null;
  }



// 获取设备型号
  static Future<String?> getDeviceModel() async {
    BaseDeviceInfo deviceInfo = await getDeviceInfo();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
      AndroidDeviceInfo.fromMap(deviceInfo.data);
      return '${androidDeviceInfo.brand} ${androidDeviceInfo.model}';
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = IosDeviceInfo.fromMap(deviceInfo.data);
      return iosDeviceInfo.utsname.machine;
    }
    return null;
  }

// 获取 IOS系统版本
  static Future<String?> getIosSystemVersion() async {
    if (Platform.isIOS) {
      BaseDeviceInfo deviceInfo = await getDeviceInfo();
      IosDeviceInfo iosDeviceInfo = IosDeviceInfo.fromMap(deviceInfo.data);
      return iosDeviceInfo.systemVersion;
    }
    return null;
  }
}