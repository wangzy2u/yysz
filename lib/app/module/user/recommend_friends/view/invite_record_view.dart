import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/recommend_friends/view/record_list_view.dart';
import '../../../../../common/widgets/appbar_x.dart';
import '../logic.dart';

class RecommendRecordPage extends StatefulWidget {
  const RecommendRecordPage({super.key});

  @override
  State<RecommendRecordPage> createState() => _RecommendRecordState();
}

class _RecommendRecordState extends State<RecommendRecordPage>  with SingleTickerProviderStateMixin{

  final RecommendFriendsLogic logic = Get.put(RecommendFriendsLogic());
  late TabController _controller;


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    logic.getQueryRedPageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: '提现记录'),
      body: RecordListItemView(),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     // ScaleTabBar(
      //     //   controller: _controller,
      //     //   tabs: const <Widget>  [
      //     //     Tab(
      //     //       child: Text('全部'),
      //     //     ),
      //     //     Tab(
      //     //       child: Text('连连钱包'),
      //     //     ),
      //     //     Tab(
      //     //       child: Text('易宝钱包'),
      //     //     )
      //     //   ],
      //     //
      //     //   indicator: CustomUnderlineTabIndicator(
      //     //       color: 0.skColor,
      //     //       width: 20.w,
      //     //       borderSide: BorderSide(width: 3.w, color: 0.skColor)),
      //     //   // indicatorColor: 2.skColor,
      //     //   isScrollable: true,
      //     //   labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
      //     //   labelColor: 1.skColor,
      //     //   unselectedLabelColor: 3.skColor,
      //     //   labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      //     //   unselectedLabelStyle:
      //     //   TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      //     // ),
      //     // Container(height: 1.w,width: double.maxFinite,color: 10.skColor,),
      //     // Expanded(
      //     //     child: ExtendedTabBarView(
      //     //       controller: _controller,
      //     //       children: <Widget>[
      //     //         RecordListItemView(),
      //       //       RecordListItemView(),
      //       //       RecordListItemView(),
      //       // ],
      //       //   )),
      //   ],
      // ),
    );
  }

}
