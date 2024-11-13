

import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/widgets/big_tab_item.dart';
import '../logic.dart';
import 'home_brand_bar.dart';

///首页tag标签选择
class HomeTagBar extends StatelessWidget{
  HomeTagBar({super.key});
  final logic = Get.put(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        color: 2.skColor,
        padding: EdgeInsets.only(left: 3.w),
        child: Row(
          children: [
            BigTabItem(
              title: '资产发售',
              isSelected: logic.appTabIndex.value == 0,
              onPressed: () {
                logic.appTabIndex.value = 0;
                logic.update();
              },
            ),
            BigTabItem(
              title: '好物优选',
              isSelected: logic.appTabIndex.value == 1,
              onPressed: () {
                logic.appTabIndex.value = 1;
                logic.update();
              },
            ),
          ],
        ),
      ).clipRRect(topLeft: 16.w,topRight: 16.w);
    });

  }
}
