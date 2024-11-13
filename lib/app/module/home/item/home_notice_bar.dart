import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/module/home/logic.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/notice_bar.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/icon_x.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../routes/app_routes.dart';

///首页公告栏
class HomeNoticeBar extends StatelessWidget {
  const HomeNoticeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        id: 'noticeId',
        builder: (logic) {
          return logic.noticeList.isNotEmpty
              ? Container(
                  height: 40.w,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      ImageX.asset(
                        'icon_notice.png'.skImagePath,
                        width: 16.w,
                        height: 14.w,
                      ),
                      NoticeBar(
                        //子Item构建器
                        itemBuilder: (BuildContext context, int index) {
                          String itemStr = '${logic.noticeList[index].title}';
                          //通常可以是一个 Text文本
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              itemStr,
                              style:
                                  TextStyle(fontSize: 13.sp, color: 1.skColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ).onTap(() {
                            //跳转公告详情
                            Get.toNamed(AppRoutes.announcementDetailPage,
                                arguments: {'id': logic.noticeList[index].id});
                          });
                        },
                        //循环的提示消息数量
                        count: logic.noticeList.length,
                      ).expand(),
                      IconX.image(
                        'icon_more.png'.skImagePath,
                        color: 3.skColor,
                        size: 15.w,
                      ).marginOnly(right: 12.w)
                    ],
                  ).height(40.w).clipRRect(all: 16.w),
                ).onTap(() {
                  Get.toNamed(AppRoutes.announcementCenterPage);
                })
              : Container(
                  height: 40.w,
                  color: 2.skColor,
                );
        });
  }
}
