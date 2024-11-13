import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../../common/res/langs/text_key.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../data/common_const.dart';
import '../../../routes/app_routes.dart';
import '../bean/entrance_bean.dart';
import '../logic.dart';

///金刚位
class HomeDiamondBar extends StatelessWidget {
  const HomeDiamondBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<HomeLogic>(
          id: 'HomeDiamondBar',
          builder: (logic) {
        return Container(
          color: 2.skColor,
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.w),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: logic.entranceList.map((e) {
              return buildItem(e);
            }).toList(),
          ),
        );
      }).clipRRect(all: 16.w).marginOnly(left: 8.w, right: 8.w, top: 12.w),
    );
  }

  Widget buildItem(EntranceBean item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageX.url(item.entrancePic??'',
            width: 40.w, height: 40.w),
        SizedBox(
          height: 6.w,
        ),
        (item.entranceName ?? '').smallContentText
      ],
    ).onTap(() {

      //webview
      if(item.entranceType == '3'){
        Get.toNamed(AppRoutes.webView,
            parameters: {'title': '', 'isShowBar': '1', 'url': item.entranceUrl ?? ''});
      }else if(item.entranceType == '2'){
        if(item.entranceUrl.isEmptyOrNull){
          ToastUtil.showToast('暂未开放');
        }else{
          Get.toNamed(item.entranceUrl ?? '');
        }

      }else{
        if(item.entranceUrl.isEmptyOrNull){
          ToastUtil.showToast('暂未开放');
        }
      }


    });
  }

}
