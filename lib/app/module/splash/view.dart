import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import 'logic.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final SplashLogic logic = Get.put(SplashLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: null,
      body: Container(
        color: 2.skColor,
        child:Container(
          alignment: Alignment.center,
          child: ImageX.asset('icon_logo_splash.png'.skImagePath,width: 0.25.sw,),
        ),
      ),
    );
  }
}
