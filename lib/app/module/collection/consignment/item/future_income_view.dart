//预计收入
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/num_util.dart';

import '../../../../../common/index.dart';
import '../logic.dart';

class FutureIncomeView extends StatelessWidget {
  const FutureIncomeView(
      {super.key,
      this.totalPrice,
      this.rates,
      this.income,
      this.transactionRates});

  //售价
  final String? totalPrice;

  //手续费
  final String? rates;

  //费率
  final String? transactionRates;

  //收入
  final String? income;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        color: 2.skColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '预计收入',
              style: TextStyle(
                  color: 1.skColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '总售价',
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '￥${totalPrice ?? '0'}',
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
                  '综合服务费${NumUtil.multiplyDecStr(transactionRates ?? '0', '100')}%',
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '￥${rates ?? '0'}',
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
                  '预计收入',
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '￥${income ?? '0'}',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ).clipRRect(all: 16.w).margin(horizontal: 15.w);
  }
}
