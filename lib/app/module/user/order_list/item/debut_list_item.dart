import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import '../../../../../common/index.dart';
import '../../../../../common/utils/toast_util.dart';
import '../../../../../common/widgets/image_x.dart';
import '../bean/order_list_bean.dart';
import '../logic.dart';

class DebutOrderListItemView extends StatefulWidget {
  @override
  _DebutOrderListItemViewState createState() => _DebutOrderListItemViewState();
}

class _DebutOrderListItemViewState extends State {

  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListLogic>(
        id: 'OrderList',
        builder: (logic) {
          if(logic.orderList.isEmpty){
            return const EmptyView();
          }
          return ListView.builder(
              padding: EdgeInsets.only(top: 0.w),
              itemCount: logic.orderList.length,
              itemBuilder: (context, index) {
                OrderListItemBean bean =  logic.orderList[index];
                return buildItem(bean);
              });
        });
  }

  String getStateStr(String state, OrderListItemBean item){
    if (state == '3') {
      return '已取消';
    } else if (state == '2') {
      return '已付款';
    } else if (state == '1') {
      return startCountdown(item);
    }
    return '';
  }

  Color getStateColor(String state){
    if (state == '3') {
      return 3.skColor;
    } else if (state == '2') {
      return 21.skColor;
    } else if (state == '1') {
      return 35.skColor;
    }
    return Colors.black;
  }

  buildItem(OrderListItemBean item) {
    return Container(
      color: 1.skColor,
      child: Container(
        height: 161.w,
        color: Colors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 12.w,top: 16.w),
                  child: Text('订单编号:${item.orderNo}', style: TextStyle(color: 3.skColor),), ),
               Container(
                 margin: EdgeInsets.only(left: 10.w,top: 15.w),
                 child:  GestureDetector(onTap: () {
                 Clipboard.setData(ClipboardData(text: '${item.orderNo}'));
                 ToastUtil.showToast('复制成功');
               }, child: ImageX(
                 type: ImageType.asset,
                 image: 'copy_icon.png'.imagePath,
                 height: 12.w,
                 width: 12.w,)),)
              ],),
            Container(
              margin: EdgeInsets.only(right: 12,top: 16),
              // child: Text('${item.stateName}', style: TextStyle(color: getStateColor('${item.state}')))),
              child: Text(getStateStr('${item.state}',item), style: TextStyle(color: getStateColor('${item.state}')),),)
          ],),
          Container(
            margin: const EdgeInsets.only(
                left: 20, top: 16, right: 20),
            height: 1.w,
            color: 10.skColor,
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 12.w,top: 16.w),
              // color: img_bg_color,
              height: 80.w,
              width: 80.w,
              child: ImageX.url(
                '${item.collectionCover}',
                width: double.infinity,
                fit: BoxFit.cover,
                radius: 10,
              ),
              // decoration: ShapeDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage('${item.collectionCover}'),
              //     // image: NetworkImage('https://fastly.picsum.photos/id/987/200/200.jpg?hmac=9X6IIE8qZgx6bJb7rf3dZELTmfyt3rZAHw65r8_ko_4'),
              //     fit: BoxFit.cover,
              //   ),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                height: 100.w,
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
                            padding: EdgeInsets.only(top: 18.w, left: 12.w),
                            child: Text(
                              '${item.collectionName}',
                              style: TextStyle(fontSize: 14.sp,color: 1.skColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),),
                          Container(
                            padding: EdgeInsets.only(top: 18.w, right: 12.w),
                            child: Text(
                              '¥${item.amount}',
                              style: TextStyle(fontSize: 18.sp,color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),)

                        ],),
                        Container(
                          padding: EdgeInsets.only(top: 12.w, left: 12.w),
                          child: Text(
                          '${item.createTime}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: 3.skColor),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],)
        ],),
      ),
    ).clipRRect(all: 12.w).margin(top: 15.w, left: 15.w, right: 15.w).onTap((){
      Get.toNamed(AppRoutes.orderDetail,
          arguments: {'id': item.id});
    });
  }

  //需要使用时调用开始倒计时
  _startTimer() {
    //设置 1 秒回调一次
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //秒数减一，更新界面
      setState(() {});
    });
  }

  //界面销毁时记得取消计时器
  _cancelTimer() {
    _timer.cancel();
    if (kDebugMode) {
      print('home time _cancelTimer');
    }
  }

  String startCountdown(OrderListItemBean item) {
    String time = '待付款';
    bool isOrderActive = true;
    Duration remainingTime = Duration.zero;
    Duration countdownDuration = Duration(minutes: 15);
    // DateTime? startTime = DateTime.parse('2024-11-08 15:30:06');
    DateTime? startTime = DateTime.parse('${item.createTime}');
    DateTime now = DateTime.now();
    Timer? countdownTimer;
    DateTime endTime = startTime!.add(countdownDuration);
    remainingTime = endTime.difference(now);
    time = '00:${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime
        .inSeconds % 60).toString().padLeft(2, '0')} 待付款';
    if (remainingTime.isNegative) {
      isOrderActive = false; // 倒计时已过，更新订单状态
      time = '待付款';
    } else {
      // countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        time = '00:${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime
            .inSeconds % 60).toString().padLeft(2, '0')} 待付款';
        print(time);
        remainingTime -= Duration(seconds: 1);
        if (remainingTime <= Duration.zero) {
          countdownTimer?.cancel();
          isOrderActive = false; // 倒计时结束，更新订单状态
          time = '';
        }
      // });
    }
    return time;
  }

  @override
  void dispose() {
    _cancelTimer();
    // TODO: implement dispose
    super.dispose();
  }

}
