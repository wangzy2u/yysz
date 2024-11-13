import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:keframe/keframe.dart';
import 'package:nft_flutter/app/module/brand_details/item/item_brand_collection.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import 'package:nft_flutter/common/index.dart';

import '../../../common/widgets/appbar_x.dart';
import '../../../common/widgets/icon_x.dart';
import '../../../common/widgets/image_x.dart';
import '../../../common/widgets/list/refresh_more_widget.dart';
import '../../data/base_api.dart';
import 'logic.dart';

///品牌详情
class BrandDetailsPage extends StatelessWidget with RefreshLoadMoreWidget {
  BrandDetailsPage({Key? key}) : super(key: key);

  final BrandDetailsLogic logic = Get.put(BrandDetailsLogic(), tag: '$presentCount');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      body: buildWidget(
        child: GetBuilder<BrandDetailsLogic>(
            tag: '$presentCount',
            builder: (logic) {
          return Stack(
            children: [
              CustomScrollView(
                controller: logic.scrollController,
                slivers: [
                  buildHeader(),
                  if(logic.brandCollectionList.isEmpty && logic.isShowEmpty)
                    const SliverToBoxAdapter(
                      child: EmptyView(),
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20),
                    sliver: SliverGrid.builder(

                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.w,
                        childAspectRatio: 0.7

                      )
                      ,
                      itemCount: logic.brandCollectionList.length,

                      itemBuilder: (BuildContext context, int index) {
                        var item = logic.brandCollectionList[index];
                        return FrameSeparateWidget(
                          index: index,
                          child: ItemBrandCollection(itemBean: item,).onTap((){
                            Get.toNamed(AppRoutes.primaryCollectionDetailPage,arguments: {
                              'id':item.id
                            });
                          }),
                        );

                      },
                    ),
                  )
                ],
              ),

              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Obx(() {
                  return buildAppbar(
                      bgColor: 2.skColor.withOpacity(logic.appBarOpacity.value),
                      iconLeft: IconX.icon(
                        Icons.arrow_back_ios_new,
                        color:
                        logic.appBarOpacity.value == 1 ? 1.skColor : 2.skColor,
                        size: 20.w,
                      ));
                }),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buildHeader() {


    return ExtendedSliverAppbar(
      leading: Container(),
      background: Stack(
        children: [
          ImageX.url(
            logic.brandDetail?.cover ?? '',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10.w+kToolbarHeight + ScreenUtil().statusBarHeight,
              ),
              Row(
                children: [
                  ImageX(
                    type: ImageType.network,
                    image: logic.brandDetail?.logo ?? '',
                    width: 49.w,
                    height: 49.w,
                    radius: 24.5.w,
                  ).paddingAll(0.5.w).border(
                      color: 2.skColor, all: 1.w, radius: 24.5.w),

                  SizedBox(width: 13.w,),
                  Text(
                    logic.brandDetail?.name ?? '',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: 2.skColor,
                        fontWeight: FontWeight.w500),
                  ),

                ],
              ).marginSymmetric(horizontal: 17.w),
              SizedBox(height: 9.w,),
              Text(
                logic.brandDetail?.introduce ?? '',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: 2.skColor,
                    fontWeight: FontWeight.w400),
              ).marginSymmetric(horizontal: 17.w),
              SizedBox(
                height: 23.w,
              ),
              Container(
                color: 4.skColor,
                height: 47.w,
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  '藏品',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: 1.skColor,
                      fontSize: 16.sp),
                ),
              ).clipRRect(topRight: 12.w, topLeft: 12.w)
            ],
          ).frostedGlass(bgColor: 1.skColor.withOpacity(0.4)),
        ],
      ),
    );



  }

  @override
  void onLoading() async {
    logic.pageNum = pageNum;
    var res = await logic.getBrandCollectionList();

    didLoadMore(res);
  }

  @override
  void onRefresh() async {
    logic.pageNum = pageNum;
    var res = await logic.getBrandCollectionList();
    didRefresh(res);
  }
}
