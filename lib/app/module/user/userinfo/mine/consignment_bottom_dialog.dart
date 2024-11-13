import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import '../../../../routes/app_routes.dart';
import 'Consignment_list_bean.dart';
import 'logic.dart';

class ConsignmentBottomDialog extends StatelessWidget {
  ConsignmentBottomDialog(this.filterNameStr, {super.key});

  String filterNameStr;

  final MineLogic logic = Get.put(MineLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 330.w,
          color: Colors.white,
          // decoration: const BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.w, top: 20.w),
                    child: Text(
                      '${this.filterNameStr}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: 1.skColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.only(right: 15.w),
                  //   child: ImageX(
                  //       type: ImageType.asset,
                  //     image: 'bottom_close.png'.skImagePath),)
                ],
              ),
              Container(
                height: 303,
                child: GetBuilder<MineLogic>(
                    id: 'consignmentDialog',
                    builder: (logic) {
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 0.w),
                          itemCount: logic.consignmentList.length,
                          itemBuilder: (context, index) {
                            ConsignmentListItemBean item =
                                logic.consignmentList[index];
                            return buildItem(item);
                          });
                    }),
              )
            ],
          )),
    );
  }

  buildItem(ConsignmentListItemBean item) {
    return Container(
      margin: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: 10.skColor, // 描边颜色
            width: 1.0, // 描边宽度
          ),
          // 如果需要，可以添加其他装饰，比如背景颜色
          color: Colors.white,
        ),
        height: 94.w,
        // color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12.w, top: 10.w),
                  // color: img_bg_color,
                  height: 70.w,
                  width: 70.w,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.collectionCover ?? ''),
                      // image: NetworkImage(
                      //     'https://fastly.picsum.photos/id/987/200/200.jpg?hmac=9X6IIE8qZgx6bJb7rf3dZELTmfyt3rZAHw65r8_ko_4'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  // color: Colors.amber,
                  // height: 140.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.w, left: 12.w),
                                child: Text(
                                  // '#3124129999',
                                  '#${item.collectionSerialNumber}',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: 1.skColor,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.w, right: 12.w),
                                child: Text(
                                  '持仓${item.holdDay ?? ''}天',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: 3.skColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 12.w, left: 12.w),
                                    child: Text(
                                      '购入价',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: 3.skColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 12.w, left: 12.w),
                                    child: Text(
                                      '${item.buyPrice ?? ''}',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: 1.skColor,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              ('${item.preventCollectionPrice}'.isEmptyOrNull ||
                                      '${item.preventCollectionPrice}' ==
                                          'null')
                                  ? Container()
                                  : Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 12.w, left: 12.w),
                                          child: Text(
                                            '防屯价',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: 3.skColor),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 12.w, left: 12.w),
                                          child: Text(
                                            '${item.preventCollectionPrice}',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: 1.skColor,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                              Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 12.w, left: 12.w),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: 3.skColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  (item.enableResale == 1)
                                      ? GestureDetector(
                                          onTap: () {
                                            // 去寄售点击
                                            Get.toNamed(
                                                AppRoutes
                                                    .assetsCollectionDetailPage,
                                                arguments: {'item': item});
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(right: 12.w),
                                            height: 28.w,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                color: 0.skColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: Center(
                                              child: Text(
                                                '去寄售',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ))
                                      : Container()
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
    // .clipRRect(all: 12.w).margin(top: 15.w, left: 15.w, right: 15.w);
  }
}
