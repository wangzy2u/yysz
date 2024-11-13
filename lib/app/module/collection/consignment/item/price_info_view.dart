import 'package:flutter/widgets.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/index.dart';

class PriceInfoView extends StatelessWidget {
  const PriceInfoView({super.key, this.price, this.latestTransactionPrice, this.preventCollectionPrice, this.guidingPrice});

  //发售价
  final num ? price;
  //最新成交价
  final num ? latestTransactionPrice;
  //防囤价
  final num ? preventCollectionPrice;
  //指导价
  final num ? guidingPrice;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      color: 2.skColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '资产发售价：',
                style: TextStyle(
                    color: 3.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '￥${price ?? '0'}',
                style: TextStyle(
                    color: 1.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '最新成交价：',
                style: TextStyle(
                    color: 3.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '￥${latestTransactionPrice ?? '0'}',
                style: TextStyle(
                    color: 1.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '防囤价：',
                style: TextStyle(
                    color: 3.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '￥${preventCollectionPrice ?? '0'}',
                style: TextStyle(
                    color: 1.skColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          Text(
            '当前寄售指导价',
            style: TextStyle(
                color: 1.skColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8.w,
          ),
          Container(
            height: 44.w,
            color: 22.skColor,
            child: Text(
              '￥${guidingPrice ?? '0'}',
              style: TextStyle(
                  color: 9.skColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ).center(),
          ).clipRRect(all: 7.w)

        ],
      ),
    ).clipRRect(all: 16.w).margin(horizontal: 15.w);
  }
}
