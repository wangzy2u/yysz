import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/order_list/item/hall_list_item.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import '../../../../common/widgets/coustom_tabbar/scale_tabbar.dart';
import '../../../../common/widgets/coustom_tabbar/under_line_tabindicator.dart';
import '../../../../common/widgets/image_x.dart';
import 'item/airdrop_list_item.dart';
import 'item/consignment_list_item.dart';
import 'item/debut_list_item.dart';
import 'logic.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({Key? key}) : super(key: key);

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage>
    with SingleTickerProviderStateMixin {
  final OrderListLogic logic = Get.put(OrderListLogic());

  // productType=FIRST_LAUNCH 首发
  // state = '' 全部  ‘1’待支付 ‘2’ 已完成 ‘3’ 已取消

  // 首发
  List debutSegmentType = ['全部', '待支付', '已完成', '已取消'];

  // 大厅
  List hallSegmentType = ['全部', '待支付', '已完成', '已取消'];

  // 寄售
  List consignmentSegmentType = ['全部', '寄售中', '已出售', '已取消'];

  // 空投
  List airdropSegmentType = ['全部', '商品转入', '已完成'];
  String currentSelStr = '全部';
  String currentSelListTypeStr = '首发';
  String currentSelListReqTypeStr = 'FIRST_LAUNCH';
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: 4.skColor,
        // appBar: buildAppbar(),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      top: kTextTabBarHeight, left: 40.w, right: 15.w),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScaleTabBar(
                        controller: tabController,
                        onTap: (int index) {
                          // ToastUtil.showToast('${index}');
                          currentSelStr = '全部';
                          if (index == 0) {
                            currentSelListTypeStr = '首发';
                            currentSelListReqTypeStr = 'FIRST_LAUNCH';
                            logic.getFindMyPayOrderByPage(
                                '', currentSelListReqTypeStr);
                          } else if (index == 1) {
                            currentSelListTypeStr = '大厅';
                            currentSelListReqTypeStr = 'LOBBY';
                            logic.getHallFindMyPayOrderByPage(
                                '', currentSelListReqTypeStr);
                          } else if (index == 2) {
                            currentSelListTypeStr = '寄售';
                            currentSelListReqTypeStr = 'CONSIGNMENT';
                            logic.getMyResaleCollectionByPage(
                                '', currentSelListReqTypeStr);
                          } else if (index == 3) {
                            currentSelListTypeStr = '空投';
                            currentSelListReqTypeStr = 'AIRDROP';
                            logic.getFindAirDropRecordHoldByPage(
                                '', currentSelListReqTypeStr, false);
                          }

                          setState(() {});
                        },
                        tabs: const <Widget>[
                          Tab(
                            child: Text('首发'),
                          ),
                          Tab(
                            child: Text('大厅'),
                          ),
                          Tab(
                            child: Text('寄售'),
                          ),
                          Tab(
                            child: Text('空投'),
                          ),
                        ],
                        indicator: CustomUnderlineTabIndicator(
                            color: 0.skColor,
                            width: 0.w,
                            borderSide:
                                BorderSide(width: 0.w, color: 0.skColor)),
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(bottom: 1.w, right: 14.w),
                        labelColor: 1.skColor,
                        unselectedLabelColor: 3.skColor,
                        labelStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.white,
                    height: 48.w,
                    // width: 300.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          top: 8.w, left: 15.w, bottom: 12.w, right: 15.w),
                      itemBuilder: (BuildContext context, int index) {
                        // final String log = logs[index];
                        return menuSegment(index);
                      },
                      itemCount: segmentCount(),
                    )),
                Expanded(
                    child: ExtendedTabBarView(
                  controller: tabController,
                  children: <Widget>[
                    DebutOrderListItemView(),
                    const HallListItemView(),
                    const ConsignmentListView(),
                    const AirdropListItemView(),
                  ],
                )),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  padding: EdgeInsets.only(
                      top: kTextTabBarHeight + 13.w, left: 15.w),
                  child: ImageX.asset(
                    'icon_back.png'.skImagePath,
                    width: 20.w,
                  )),
            )
          ],
        ));
  }

  int segmentCount() {
    switch (currentSelListTypeStr) {
      case '首发':
        return debutSegmentType.length;
      case '大厅':
        return hallSegmentType.length;
      case '寄售':
        return consignmentSegmentType.length;
      case '空投':
        return airdropSegmentType.length;
    }
    return 0;
  }

  Widget menuSegment(int index) {
    String name = debutSegmentType[index];
    switch (currentSelListTypeStr) {
      case '首发':
        name = debutSegmentType[index];
        break;
      case '大厅':
        name = hallSegmentType[index];
        break;
      case '寄售':
        name = consignmentSegmentType[index];
        break;
      case '空投':
        name = airdropSegmentType[index];
        break;
    }
    return GestureDetector(
      onTap: () {
        // ToastUtil.showToast('${index}');
        currentSelStr = name;
        String state = '';
        if (index == 0) {
          state = '';
        } else {
          state = '${index}';
        }
        switch (currentSelListTypeStr) {
          case '首发':
            logic.getFindMyPayOrderByPage(state, currentSelListReqTypeStr);
            break;
          case '大厅':
            logic.getHallFindMyPayOrderByPage(state, currentSelListReqTypeStr);
            break;
          case '寄售':
            logic.getMyResaleCollectionByPage(state, currentSelListReqTypeStr);
            break;
          case '空投':
            if (state == '1'){
              logic.getFindAirDropRecordHoldByPage(state, currentSelListReqTypeStr, false);
            } else if (state == '2'){
              logic.getFindAirDropRecordHoldByPage(state, currentSelListReqTypeStr, true);
            } else {
              logic.getFindAirDropRecordHoldByPage(state, currentSelListReqTypeStr, false);
            }
            break;
        }
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(left: 16.w),
        height: 28.w,
        width: 52.w,
        decoration: BoxDecoration(
            color: currentSelStr == name ? Colors.black : 5.skColor,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: currentSelStr == name ? Colors.white : 9.skColor,
            ),
          ),
        ),
      ),
    );
  }

}
