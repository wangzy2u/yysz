//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';

import '../../../../../common/index.dart';
import '../../../../../common/widgets/image_x.dart';

class OrderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 0.skColor,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: ImageX.asset(
                'icon_back.png'.skImagePath,
                width: 20.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
       Size(double.infinity, 48.w );
}
