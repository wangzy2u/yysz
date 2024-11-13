// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';

class SplashLogic extends GetxController {


  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();

    Future.delayed(const Duration(milliseconds: 2000),(){
      if(UserInfoManager().isLogin){
        Get.offAllNamed(AppRoutes.mainTabPage);
      }else{
        Get.offAllNamed(AppRoutes.login,arguments: {'isToMain':true});
      }
    });

  }
}
