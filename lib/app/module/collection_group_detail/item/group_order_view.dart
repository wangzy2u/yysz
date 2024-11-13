

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../brand_details/bean/collection_detail_bean.dart';

//挂单详情页面订单价格等信息
class GroupOrderView extends StatelessWidget {
  const GroupOrderView({super.key, this.detailBean});
  final CollectionDetailBean  ? detailBean;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      padding: EdgeInsets.all(12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Column(
            children: [
              buildTitle('发行价格','￥${detailBean?.price ?? 0}'),
              SizedBox(height: 12.w,),
              buildTitle('最低价格','￥${detailBean?.minResalePrice ?? 0}'),
            ],
          ).expand(),
          SizedBox(width: 25.w,),
          Column(
            children: [
              buildTitle('当前挂单','${detailBean?.sellNum ?? 0}'),
              SizedBox(height: 12.w,),
              buildTitle('你最多可购买','${detailBean?.singlePersonLimit ?? 0}份'),
            ],
          ).expand()


        ],
      ),

    ).clipRRect(all: 16.w).margin(horizontal: 15.w);
  }



  buildTitle(String key,String value){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key,
          style: TextStyle(
              color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
        ),

        Text(
          value,
          style: TextStyle(
              color: 1.skColor, fontSize: 14.sp,fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
