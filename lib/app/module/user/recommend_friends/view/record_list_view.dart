import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import '../../../../widgets/empty_view.dart';
import '../withdrawal_details_bean.dart';
import '../logic.dart';

class RecordListItemView extends StatelessWidget {
  RecordListItemView({super.key});

  final RecommendFriendsLogic logic = Get.put(RecommendFriendsLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendFriendsLogic>(
        // id: 'OrderList',
        builder: (logic) {
          if(logic.recordList.isEmpty){
            return const EmptyView();
          }
          return ListView.builder(
              padding: EdgeInsets.only(top: 0.w),
              itemCount: logic.recordList.length,
              itemBuilder: (context, index) {
                WithdrawalDetailsItemBean bean =  logic.recordList[index];
                return buildItem(bean);
              });
        });
  }

  buildItem(WithdrawalDetailsItemBean bean) {
    return Container(
      // color: Colors.red,
      height: 80.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w, top: 16.w),
                  child: Text(
                    '提现',
                    style: TextStyle(color: 1.skColor, fontSize: 14.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.w, top: 16.w),
                  child: Container(

                    height: 16.w,
                    width: 32.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: 0.skColor, // 描边颜色
                          width: 0.5, // 描边宽度
                        ),
                        color: Color.fromRGBO(0, 83, 255, 0.1),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: Text(
                        '易宝',
                        style: TextStyle(fontSize: 10, color: 0.skColor),
                      ),
                    ),
                  ),
                ),
              ],),
              Container(
                margin: EdgeInsets.only(right: 15.w, top: 16.w),
                child: Text(
                  '-${bean.orderAmount}',
                  style: TextStyle(color: 11.skColor, fontSize: 14.sp),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.w, top: 8.w),
                child: Text(
                  '${bean.gmtCreate}',
                  style: TextStyle(color: 3.skColor, fontSize: 12.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15.w, top: 8.w),
                child: Text(
                  '提现成功',
                  style: TextStyle(color: 3.skColor, fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: 15.w, top: 16.w, right: 15.w),
            height: 1.w,
            color: 10.skColor,
          ),
        ],
      ),
    );
  }

// buildItem(OrderListItemBean item) {
//   return Container(
//     color: 1.skColor,
//     child: Container(
//       height: 161.w,
//       color: Colors.white,
//       child: Column(children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(children: [
//               Container(
//                 margin: EdgeInsets.only(left: 12.w,top: 16.w),
//                 child: Text('订单编号:${item.orderNo}', style: TextStyle(color: 3.skColor),), ),
//              Container(
//                margin: EdgeInsets.only(left: 10.w,top: 15.w),
//                child:  GestureDetector(onTap: () {
//                Clipboard.setData(ClipboardData(text: '${item.orderNo}'));
//                ToastUtil.showToast('复制成功');
//              }, child: ImageX(
//                type: ImageType.asset,
//                image: 'copy_icon.png'.imagePath,
//                height: 12.w,
//                width: 12.w,)),)
//             ],),
//           Container(
//             margin: EdgeInsets.only(right: 12,top: 16),
//             child: Text(getStateStr('${item.state}'), style: TextStyle(color: getStateColor('${item.state}')),),)
//         ],),
//         Container(
//           margin: const EdgeInsets.only(
//               left: 20, top: 16, right: 20),
//           height: 1.w,
//           color: 10.skColor,
//         ),
//         Row(children: [
//           Container(
//             margin: EdgeInsets.only(left: 12.w,top: 16.w),
//             // color: img_bg_color,
//             height: 80.w,
//             width: 80.w,
//             child: ImageX.url(
//               '${item.collectionCover}',
//               width: double.infinity,
//               fit: BoxFit.cover,
//               radius: 10,
//             ),
//             // decoration: ShapeDecoration(
//             //   image: DecorationImage(
//             //     image: NetworkImage('${item.collectionCover}'),
//             //     // image: NetworkImage('https://fastly.picsum.photos/id/987/200/200.jpg?hmac=9X6IIE8qZgx6bJb7rf3dZELTmfyt3rZAHw65r8_ko_4'),
//             //     fit: BoxFit.cover,
//             //   ),
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(10),
//             //   ),
//             // ),
//           ),
//           Expanded(
//             child: Container(
//               // color: Colors.amber,
//               height: 100.w,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                         Container(
//                           padding: EdgeInsets.only(top: 18.w, left: 12.w),
//                           child: Text(
//                             '${item.collectionName}',
//                             style: TextStyle(fontSize: 14.sp,color: 1.skColor),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),),
//                         Container(
//                           padding: EdgeInsets.only(top: 18.w, right: 12.w),
//                           child: Text(
//                             '¥${item.amount}',
//                             style: TextStyle(fontSize: 18.sp,color: Colors.black),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),)
//
//                       ],),
//                       Container(
//                         padding: EdgeInsets.only(top: 12.w, left: 12.w),
//                         child: Text(
//                         '${item.createTime}',
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             color: 3.skColor),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],)
//       ],),
//     ),
//   ).clipRRect(all: 12.w).margin(top: 15.w, left: 15.w, right: 15.w).onTap((){
//     Get.toNamed(AppRoutes.orderDetail,
//         arguments: {'id': item.id});
//   });
// }
}
