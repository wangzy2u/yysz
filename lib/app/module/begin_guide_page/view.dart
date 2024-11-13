

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';

import '../../../common/index.dart';
import '../../../common/widgets/appbar_x.dart';
import '../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import 'item/guide_view.dart';
import 'item/tutorial_view.dart';
import 'logic.dart';

class BeginGuidePage extends StatefulWidget {
  const BeginGuidePage({super.key});

  @override
  State<BeginGuidePage> createState() => _BeginGuidePageState();
}

class _BeginGuidePageState extends State<BeginGuidePage> with SingleTickerProviderStateMixin{
  final BeginGuideLogic logic = Get.put(BeginGuideLogic());
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      appBar: buildAppbar(title: '使用说明'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ScaleTabBar(
            controller: _controller,
            tabs: const <Widget>  [
              Tab(
                child: Text('新功能介绍'),
              ),
              Tab(
                child: Text('新手引导'),
              ),
            ],

            indicator: CustomUnderlineTabIndicator(
                color: 0.skColor,
                width: 20.w,
                borderSide: BorderSide(width: 3.w, color: 0.skColor)),
            // indicatorColor: 2.skColor,
            isScrollable: false,
            labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
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
                  TutorialView(),
                  GuideView(),

                ],
              )),
        ],
      ),
    );
  }
}
