


import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:nft_flutter/app/data/base_api.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';

import '../../common/http/http/dio_new.dart';
import '../../common/index.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() async {
    //
    Get.lazyPut(() => UserInfoManager(), fenix: true);



  }
}
