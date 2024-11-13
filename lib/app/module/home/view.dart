import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:nft_flutter/app/module/home/item/home_banner_bar.dart';
import 'package:nft_flutter/app/module/home/item/home_brand_bar.dart';
import 'package:nft_flutter/app/module/home/item/home_tag_bar.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:nft_flutter/common/res/langs/index.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:nft_flutter/common/widgets/list/custom_footer.dart';

import '../../../common/widgets/image_x.dart';
import '../../../common/widgets/list/refresh_more_widget.dart';
import '../../widgets/empty_view.dart';
import '../main_tab/logic.dart';
import 'item/home_diamond_bar.dart';
import 'item/item_first_release.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return DefaultStickyHeaderController(
      child: Column(
        children: [
          Container(
            height: statusBarHeight,
            color: 2.skColor,
          ),
          Expanded(
            child: Container(
              color: 22.skColor,
              child: EasyRefresh.builder(
                header: const MaterialHeader(
                  clamping: true,
                ),
                footer: CustomFooter(triggerOffset: 40, clamping: false),
                onRefresh: () async {

                  logic.pageNum = 1;
                  logic.getHomeFirst();
                  logic.getBanner();
                  logic.getNotice();
                  logic.getHomeIssuer();
                  return IndicatorResult.success;
                },
                onLoad: () async {
                  logic.pageNum += 1;
                  var noMore = await logic.getHomeFirst();
                  if (noMore) {
                    return IndicatorResult.noMore;
                  }
                  return IndicatorResult.none;
                },
                childBuilder: (context, physics) {
                  return GetBuilder<HomeLogic>(builder: (logic) {
                    return CustomScrollView(
                      physics: physics,
                      slivers: [
                        const HomeBannerBar(),
                        //金刚位
                        const HomeDiamondBar(),
                        buildGrid(),
                        //合作品牌
                        const HomeBrandBar(),
                        SliverStickyHeader(
                          header: HomeTagBar(),
                          sliver: _buildList(),
                        ),
                      ],
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (logic.appTabIndex.value == 0) {
      return logic.firstReleaseList.isEmpty
          ? SliverToBoxAdapter(
              child: SizedBox(
                height: 300.w,
                child: const EmptyView(),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: logic.firstReleaseList.length, (context, index) {
              return ItemFirstRelease(
                itemBean: logic.firstReleaseList[index],
              ).onTap((){
                Get.toNamed(AppRoutes.primaryCollectionDetailPage,
                    arguments: {'id': logic.firstReleaseList[index].id});
              });;
            }));
    } else {
      return logic.firstReleaseList.isNotEmpty
          ? SliverToBoxAdapter(
              child: SizedBox(
                height: 300.w,
                child: const EmptyView(),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: logic.firstReleaseList.length, (context, index) {
              return ItemFirstRelease(
                itemBean: logic.firstReleaseList[index],
              ).onTap((){
                Get.toNamed(AppRoutes.primaryCollectionDetailPage,
                    arguments: {'id': logic.firstReleaseList[index].id});
              });
            }));
    }
  }

  Widget buildGrid() {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          var mainLogic = Get.find<MainTabLogic>();
          mainLogic.changeToPage(1);

          logic.getHomeEntrance();
        },
        child: Container(
          height: 72.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    TextKey.ecosystemIncubationTitle.tr,
                    style: TextStyle(
                        fontSize: 18.sp,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                        color: 0.skColor),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  ImageX.asset(
                    'icon_right_more_blue.png'.skImagePath,
                    height: 14.w,
                    width: 8.w,
                  )
                ],
              ),
              SizedBox(
                height: 5.w,
              ),
              Text(
                TextKey.ecosystemIncubationSubTitle.tr,
                style: TextStyle(
                    fontSize: 12.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w400,
                    color: 9.skColor),
              ),
            ],
          ),
        )
            .backgroundImage(DecorationImage(
              image: AssetImage('bg_home_ecosystem_incubation.png'.imagePath),
              fit: BoxFit.fill,
            ))
            .fractionallySizedBox(widthFactor: 1)
            .marginOnly(left: 8.w, right: 8.w, top: 12.w),
      ),
    );
  }
}
