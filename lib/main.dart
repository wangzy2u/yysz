import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/data/global_service.dart';
import 'app/routes/app_routes.dart';
import 'app/data/all_bindings.dart';
import 'common/index.dart';
import 'common/res/langs/translation_library.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SpUtil.getInstance();
  Get.put(GlobalService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: AppRoutes.initial,
          initialBinding: AllControllerBinding(),
          getPages: AppRoutes.routes,
          defaultTransition: Transition.cupertino,
          theme: ThemeData(
            fontFamily: 'CustomFont',
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          // 主题模式
          themeMode: GlobalService.to.themeMode,
          // 国际化配置
          locale: GlobalService.to.locale,
          translations: TranslationLibrary(),
          fallbackLocale: TranslationLibrary.fallbackLocale,
          supportedLocales: TranslationLibrary.supportedLocales,
          localizationsDelegates: TranslationLibrary.localizationsDelegates,
          builder: (context, child) {
            var builder = FlutterSmartDialog.init();
            return builder(
                context,
                GestureDetector(
                  child: child,
                  onTap: () {
                    //全局点击空白区域取消键盘
                    FocusScope.of(context).requestFocus(FocusNode());
                    FocusScope.of(context).unfocus();
                  },
                ));
          },
        );
      },
    );
  }
}
