import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/text_util.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import '../hall/item/assets_list_view.dart';
import 'item/item_member_card_view.dart';
import 'logic.dart';

/// 数字身份
class DigitalIdentityPage extends StatefulWidget {
  const DigitalIdentityPage({super.key});

  @override
  State<DigitalIdentityPage> createState() => _DigitalIdentityPageState();
}

class _DigitalIdentityPageState extends State<DigitalIdentityPage> with SingleTickerProviderStateMixin{
  final DigitalIdentityLogic logic = Get.put(DigitalIdentityLogic());
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this,initialIndex: logic.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              26.skColor, // 第一种颜色
              27.skColor, // 第二种颜色
              28.skColor, // 第三种颜色
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GetBuilder<DigitalIdentityLogic>(builder: (logic) {
          return Column(
            children: [
              buildAppbar(bgColor: Colors.transparent, title: '数字身份'),
              SizedBox(height: 12.w,),
              ImageX.url(
                logic.userInfoBean?.avatar ?? '',
                width: 64.w,
                height: 64.w,
                placeholder: ImageX(
                  image: 'head_defalut.png'.imagePath,
                  type: ImageType.asset,
                ),
              ),
              SizedBox(height: 8.w,),
              Text(TextUtil.maskPhoneNumber(logic.userInfoBean?.mobile), style: TextStyle(
                fontSize: 20.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 20.w,),

              ScaleTabBar(
                controller: _controller,
                tabs: const <Widget>[
                  Tab(
                    child: Text('元域居民'),
                  ),
                  Tab(
                    child: Text('元域团长'),

                  ),
                  Tab(
                    child: Text('元域网点'),

                  ),
                  Tab(
                    child: Text('元域中心'),

                  ),
                ],

                indicator: CustomUnderlineTabIndicator(
                    color: 0.skColor,
                    width: 20.w,

                    borderSide: BorderSide(width: 3.w, color: 1.skColor)),
                isScrollable: false,
                labelPadding: EdgeInsets.only(bottom: 1.w, right: 5.w,left: 5.w),
                labelColor: 1.skColor,
                unselectedLabelColor: 9.skColor,
                labelStyle: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
                unselectedLabelStyle:
                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),

              Expanded(
                child: ExtendedTabBarView(
                  controller: _controller,
                  children: <Widget>[
                    ItemMemberCardView(memberCardListBean: logic.residentCardListBean,),
                    ItemMemberCardView(memberCardListBean: logic.groupCardListBean,),
                    ItemMemberCardView(memberCardListBean: null,),
                    ItemMemberCardView(memberCardListBean: null,),
                  ],
                ),
              ),


            ],
          );
        }).frostedGlass(bgColor: 2.skColor.withOpacity(0.7)),
      ),
    );
  }
}
