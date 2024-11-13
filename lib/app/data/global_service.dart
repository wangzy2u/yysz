

import 'dart:io';
import 'dart:ui';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_flutter/app/data/base_api.dart';

import '../../common/http/http/dio_new.dart';
import '../../common/index.dart';
import '../../common/res/langs/translation_library.dart';
import '../module/user/user_info_manager.dart';
/// 语言改变的回调
typedef LocaleChangeCallback = Function(Locale locale);

class GlobalService extends GetxService{
  static GlobalService get to => Get.find();

  static const String themeCodeKey = 'themeCodeKey';
  static const String languageCodeKey = 'languageCodeKey';

  //主题
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  //语言
  Locale locale = PlatformDispatcher.instance.locale;
  LocaleChangeCallback? localeChangeCallback;

  late EventBus eventBus;


  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();

    eventBus = EventBus();

    HttpConfig dioConfig =
    HttpConfig(baseUrl: BaseApi.baseUrl,
      // proxy: '192.168.100.19:8888',
      // interceptors: [DioCacheInterceptor()]
    );
    // HttpConfig(baseUrl: "https://gank.io/", proxy: "192.168.2.249:8888");
    HttpClient client = HttpClient(dioConfig: dioConfig);
    Get.put<HttpClient>(client);

    await SpUtil.getInstance();
    Get.lazyPut(() => UserInfoManager(), fenix: true);

    //初始化本地语言配置
    _initLocale(TranslationLibrary.supportedLocales);
    //初始化主题配置
    _initTheme();

    // if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 竖屏 Portrait 模式
      DeviceOrientation.portraitDown,
    ]);


    super.onInit();
  }


  /// 系统当前是否是暗黑模式
  bool isDarkModel(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  /// 初始 theme
  void _initTheme() {
    var themeCode = SpUtil.getString(themeCodeKey) ?? 'system';
    switch (themeCode) {
      case 'system':
        _themeMode = ThemeMode.system;
        break;
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
    }
  }

  /// 更改主题
  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    Get.changeThemeMode(_themeMode);
    if (_themeMode == ThemeMode.system) {
      await SpUtil.putString(themeCodeKey, 'system');
    } else {
      await SpUtil.putString(
          themeCodeKey, themeMode == ThemeMode.dark ? 'dark' : 'light');
    }
    updateNavigationBar();
    refreshAppui();
  }

  updateNavigationBar([BuildContext? context]) {
    if (Platform.isAndroid) {
      bool isDarkMode = isDarkModel(context ?? Get.context!);
      if (_themeMode != ThemeMode.system) {
        isDarkMode = _themeMode == ThemeMode.dark;
      }
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: isDarkMode ? Colors.black87 : Colors.white,
          systemNavigationBarIconBrightness: isDarkMode
              ? Brightness.light // Light icons on dark background
              : Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
          systemStatusBarContrastEnforced: isDarkMode,
        ),
      );
    }
  }


  // 初始化本地语言配置
  void _initLocale(List<Locale>? supportedLocales) {
    if (supportedLocales == null) {
      return;
    }
    var langCode = SpUtil.getString(languageCodeKey) ?? '';
    if (langCode.isEmpty) {
      return;
    }
    var index = supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) {
      return;
    }
    locale = supportedLocales[index];
    localeChangeCallback?.call(locale);
  }


  // 更改语言
  Future<void> changeLocale(Locale value) async {
    locale = value;
    localeChangeCallback?.call(locale);
    SpUtil.putString(languageCodeKey, value.languageCode);
    Get.updateLocale(value);
    refreshAppui();
  }


  /// 刷新App所有页面
  void refreshAppui() {
    // sendEvent(const RefreshUiEvent());
  }

}