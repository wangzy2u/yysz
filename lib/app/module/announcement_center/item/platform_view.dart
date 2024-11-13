//平台公告
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/tag/tag_item.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/big_tab_item.dart';
import '../../../../common/widgets/list/refresh_more_widget.dart';
import '../../../routes/app_routes.dart';
import '../bean/platform_list_bean.dart';
import '../logic.dart';

class PlatformView extends StatelessWidget with RefreshLoadMoreWidget {
  PlatformView({super.key});

  final logic = Get.find<AnnouncementCenterLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnnouncementCenterLogic>(
        id: 'PlatformView',
        builder: (logic) {
          return Column(
            children: [
              SizedBox(
                height: 12.w,
              ),
              buildTag(),
              Expanded(
                  child: buildWidget(
                      child: ListView.builder(
                          itemCount: logic.platformList.length,
                          itemBuilder: (context, index) {
                            return buildItem(logic.platformList[index]);
                          })))
            ],
          );
        });
  }

  buildTag() {
    if (logic.tagList.isEmpty) {
      return Container();
    }

    return Obx(() {
      return Container(
        width: double.maxFinite,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Wrap(
          spacing: 16.w,
          runSpacing: 8.w, // 设置子项之间的垂直间距
          children: List.generate(logic.tagList.length, (index) {
            return TagItem(
              title: logic.tagList[index].dictItemName ?? '',
              selected: logic.tagSelectIndex == index,
            ).onTap(() {
              pageNum = 1;
              logic.selectTag(index);
            });
          }).toList(),
        ),
      );
    });
  }

  buildItem(PlatformContent item) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.announcementDetailPage,arguments: {
          'id':item.id
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 15.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.centerLeft,
            child: Text(
              item.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                  height: 1,
                  fontSize: 16.sp,
                  color: 1.skColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.centerLeft,
            child: Text(
              item.id ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                  height: 1,
                  fontSize: 14.sp,
                  color: 9.skColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
                color: 19.skColor.withOpacity(0.2),
                child: Text(
                  logic.tagList[logic.tagSelectIndex.value].dictItemName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      height: 1,
                      fontSize: 12.sp,
                      color: 19.skColor,
                      fontWeight: FontWeight.w400),
                ),
              )
                  .clipRRect(all: 4.w)
                  .border(all: 1.w, color: 19.skColor, radius: 4.w),
              Text(
                item.publishTime ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                    height: 1,
                    fontSize: 14.sp,
                    color: 9.skColor,
                    fontWeight: FontWeight.w400),
              )
            ],
          ).paddingSymmetric(horizontal: 15.w),
          SizedBox(
            height: 15.w,
          ),
          Container(
            height: 1.w,
            width: double.maxFinite,
            color: 10.skColor,
          )
        ],
      ),
    );
  }

  @override
  void onLoading() async {
    var res = await logic.getPlatformList(
        logic.tagList[logic.tagSelectIndex.value].dictItemCode ?? '1', pageNum);

    didLoadMore(res);
  }

  @override
  void onRefresh() async {
    var res = await logic.getPlatformList(
        logic.tagList[logic.tagSelectIndex.value].dictItemCode ?? '1', pageNum);
    didRefresh(res);
  }
}
