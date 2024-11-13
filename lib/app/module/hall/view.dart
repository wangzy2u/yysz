import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nft_flutter/app/module/hall/item/assets_list_view.dart';
import 'package:nft_flutter/app/module/hall/item/hall_filter_dialog.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/widgets/big_tab_item.dart';

import '../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import '../../../common/widgets/icon_x.dart';
import '../../../common/widgets/image_x.dart';
import '../../widgets/empty_view.dart';
import 'logic.dart';

///大厅
class HallPage extends StatelessWidget {
  const HallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HallLogic logic = Get.put(HallLogic());

    return Container(
      color: 4.skColor,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [6.skColor, 4.skColor], // 渐变的颜色数组
                begin: Alignment.topCenter, // 渐变开始的方向
                end: Alignment.bottomCenter, // 渐变结束的方向
              ),
            ),
            height: 197.w,
          ),


          DefaultTabController(length: 3, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                padding: EdgeInsets.only(
                    top: kTextTabBarHeight, left: 15.w, right: 15.w),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScaleTabBar(
                      tabs: const <Widget>[
                        Tab(
                          child: Text('资产'),
                        ),
                        Tab(
                          child: Text('道具'),

                        ),
                        Tab(
                          child: Text('碎片'),

                        ),
                      ],

                      indicator: CustomUnderlineTabIndicator(
                          color: 0.skColor,
                          width: 0.w,
                          borderSide: BorderSide(width: 0.w, color: 0.skColor)),
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(bottom: 1.w, right: 14.w),
                      labelColor: 1.skColor,
                      unselectedLabelColor: 3.skColor,
                      labelStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                      unselectedLabelStyle:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),


                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.searchPage);
                      },
                      child: IconX.image(
                        'icon_search.png'.skImagePath, size: 20.w,),
                    )

                  ],
                ),
              ),
              buildFilter(),

              Expanded(
                  child: ExtendedTabBarView(
                    children: <Widget>[
                      AssetsListView(),
                      EmptyView(),
                      EmptyView()
                    ],
                  )),
            ],
          ))


        ],
      ),
    );
  }


  Widget buildFilter() {
    return GetBuilder<HallLogic>(builder: (logic) {
      return InkWell(
        onTap: () async {
          var result = await Get.bottomSheet(HallFilterDialog(issuerList:logic.issuerList,selectIndex: logic.selectIssuerIndex,));
          logic.filterHall(result);
        },
        child: Container(
          margin: EdgeInsets.only(top: 5.w, left: 15.w),
          height: 36.h,
          width: 95.w,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Obx(() {
                // return
                Text(
                  '全部品牌',
                  style: TextStyle(
                      height: 1,
                      fontSize: 14.sp,
                      color: 1.skColor,
                      fontWeight: FontWeight.w500),
                ),
                // }),
                SizedBox(
                  width: 12.w,
                ),
                ImageX.asset('down_arrow.png'.imagePath, width: 9.w,
                  height: 6.w,
                  fit: BoxFit.cover,),
              ],
            ),
          ),
        ),
      );
    });
  }
}
