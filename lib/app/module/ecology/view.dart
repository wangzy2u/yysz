import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:nft_flutter/app/module/ecology/ecology_bottom_dialog.dart';
import 'package:nft_flutter/app/module/ecology/bean/eclolgy_filter_bean.dart';
import '../../../common/index.dart';
import '../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import '../../../common/widgets/image_x.dart';
import '../../../common/widgets/list/custom_footer.dart';
import '../../routes/app_routes.dart';
import '../../widgets/empty_view.dart';
import 'bean/eclolgy_list_bean.dart';
import 'logic.dart';

class EcologyPage extends StatelessWidget {
  EcologyPage({Key? key}) : super(key: key);

  final EcologyLogic logic = Get.put(EcologyLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [6.skColor, 2.skColor], // 渐变的颜色数组
            begin: Alignment.topCenter, // 渐变开始的方向
            end: Alignment.bottomCenter, // 渐变结束的方向
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTab(),
            buildFilter(),
            buildList(),
          ],
        ));
  }

  void dialogShow() {
    Get.bottomSheet(ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: 256.w,
          child: GetBuilder<EcologyLogic>(
              id: 'ecologDialog',
              builder: (logic) {
                return EcologyBottomDialog(logic.filterNameStr);
              }),
        ))).then((value) {
      // print('tanchuangfanhuide-----$value');
      if (value > 0) {
        EclolgyFilterItemBean bean = logic.ecologyFilterList[value - 1];
        logic.getEcologyFilterList('${bean.id}');
        logic.filterNameStr = bean.name!;
        logic.update();
      } else {
        logic.filterNameStr = '全部品牌';
        logic.getEcologyFilterList('');
        logic.update();
      }
    });
  }

  Widget buildFilter() {
    return GestureDetector(
      onTap: () {
        dialogShow();
      },
      child: Container(
        margin: EdgeInsets.only(top: 0.w, left: 15.w),
        height: 36.w,
        width: 95.w,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<EcologyLogic>(builder: (ecologyLogic) {
                return Expanded(
                    child: Center(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    logic.filterNameStr,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500),
                  ),
                ));
              }),
              ImageX.asset(
                'down_arrow.png'.imagePath,
                width: 9.w,
                height: 6.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 12.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return GetBuilder<EcologyLogic>(
        id: 'ecologList',
        builder: (logic) {
          return logic.ecologyList.length > 0
              ? Expanded(
                  child: EasyRefresh.builder(
                      header: const MaterialHeader(
                        clamping: true,
                      ),
                      footer: CustomFooter(triggerOffset: 40, clamping: false),
                      onRefresh: () async {
                        logic.pageNum = 1;
                        logic.getEcologyList();
                        return IndicatorResult.success;
                      },
                      onLoad: () async {
                        logic.pageNum += 1;
                        var noMore = await logic.getEcologyList();
                        if (noMore) {
                          return IndicatorResult.noMore;
                        }
                        return IndicatorResult.none;
                      },
                      childBuilder: (context, physics) {
                        return ListView.builder(
                          physics: physics,
                          padding: EdgeInsets.only(top: 5.w),
                          // physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: logic.ecologyList.length,
                          itemBuilder: (context, index) {
                            EcologyItemBean bean = logic.ecologyList[index];
                            // 构建列表项
                            return listItem(bean);
                          },
                        );
                      }),
                )
              : EmptyView();
        });
  }

  GestureDetector listItem(EcologyItemBean bean) {
    return GestureDetector(
      onTap: () {
        //跳转
        Get.toNamed(AppRoutes.collectionGroupDetailPage,
            arguments: {'collectionId': bean.collectionId ?? ''});
      },
      child: Container(
        decoration: BoxDecoration(
          color: 2.skColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        height: 194.w,
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.w),
        child: Padding(
          padding: EdgeInsets.only(top: 12.w, left: 12.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ImageX.url(
                        '${bean.collectionCover}',
                        width: 140.w,
                        height: 140.w,
                        fit: BoxFit.cover,
                        radius: 16.w,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.w, left: 8.w),
                        height: 22.w,
                        width: 56.w,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Center(
                          child: Text(
                            '挂单 ${bean.orderCount}',
                            style: TextStyle(fontSize: 12.sp, color: 2.skColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          '${bean.collectionName}',
                          style: TextStyle(
                              color: 1.skColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 12.w,
                          // ),
                          Text(
                            '发行方',
                            style: TextStyle(color: 3.skColor, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            '${bean.issuerName}',
                            style: TextStyle(color: 1.skColor, fontSize: 14.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 12.w,
                          // ),
                          Text('地板价格',
                              style:
                                  TextStyle(color: 3.skColor, fontSize: 14.sp)),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            '¥ ${bean.minPrice}',
                            style: TextStyle(color: 1.skColor, fontSize: 14.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 12.w,
                          // ),
                          Text('孵化周期',
                              style:
                                  TextStyle(color: 3.skColor, fontSize: 14.sp)),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            '${bean.incubationPeriod}天',
                            style: TextStyle(color: 1.skColor, fontSize: 14.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 12.w,
                          // ),
                          // Text('孵化上限',
                          //     style: TextStyle(color: 3.skColor, fontSize: 14.sp)),
                          Text('指导价格',
                              style:
                                  TextStyle(color: 3.skColor, fontSize: 14.sp)),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            '+${((bean.dailyIncrease ?? 0) * 100).toStringAsFixed(0)}%/天',
                            style: TextStyle(color: 1.skColor, fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.w, left: 0.w),
                    height: 20.w,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: 22.skColor,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '系列: ${bean.seriesName}',
                        style: TextStyle(fontSize: 10.sp, color: 9.skColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.w, left: 12.w),
                    height: 20.w,
                    width: 82.w,
                    decoration: BoxDecoration(
                        color: 22.skColor,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '限量:${bean.quantity}份',
                        style: TextStyle(fontSize: 10.sp, color: 9.skColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTab() {
    return DefaultTabController(
        length: 1,
        child: Container(
          height: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: kTextTabBarHeight, left: 15.w),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScaleTabBar(
                      tabs: const <Widget>[
                        Tab(
                          child: Text('孵化'),
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
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: 1.skColor),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: 1.skColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
