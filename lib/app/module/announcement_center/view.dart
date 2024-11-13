import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/module/announcement_center/item/brand_view.dart';
import 'package:nft_flutter/app/module/announcement_center/item/platform_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';

import '../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import '../../../common/widgets/tabbar/material_indicator.dart';
import 'logic.dart';

///公告中心
class AnnouncementCenterPage extends StatefulWidget {
  const AnnouncementCenterPage({super.key});

  @override
  State<AnnouncementCenterPage> createState() => _AnnouncementCenterPageState();
}

class _AnnouncementCenterPageState extends State<AnnouncementCenterPage> with SingleTickerProviderStateMixin{
  final AnnouncementCenterLogic logic = Get.put(AnnouncementCenterLogic());
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      appBar: buildAppbar(title: '公告中心'),
      body: Column(
        children: [

          ScaleTabBar(
            controller: _controller,
            tabs: const <Widget>  [
              Tab(
                child: Text('平台公告'),
              ),
              Tab(
                child: Text('品牌合作'),
              ),
            ],

            indicator: CustomUnderlineTabIndicator(
                color: 0.skColor,
                width: 20.w,
                borderSide: BorderSide(width: 3.w, color: 0.skColor)),
            // indicatorColor: 2.skColor,
            isScrollable: false,
            labelPadding: EdgeInsets.only(bottom: 1.w),
            labelColor: 1.skColor,
            unselectedLabelColor: 3.skColor,
            labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
          Container(height: 1.w,width: double.maxFinite,color: 10.skColor,),
          Expanded(
              child: ExtendedTabBarView(
                controller: _controller,
                children: <Widget>[
                  PlatformView(),

                  BrandView(),
                ],
              )),
        ],
      ),
    );
  }
}

