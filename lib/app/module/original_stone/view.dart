import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/data/global_service.dart';
import 'package:nft_flutter/app/module/collection/item/creator_item_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/date_util.dart';
import 'package:nft_flutter/common/utils/text_util.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../common/widgets/appbar_x.dart';
import 'logic.dart';

///元石
class OriginalStonePage extends StatelessWidget {
  OriginalStonePage({Key? key}) : super(key: key);

  final OriginalStoneLogic logic = Get.put(OriginalStoneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 22.skColor,
      body: Stack(
        children: [
          Container(
            height: 197.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  29.skColor.withOpacity(0.12), // 第一种颜色
                  7.skColor, // 第三种颜色
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          GetBuilder<OriginalStoneLogic>(builder: (logic) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  buildAppbar(bgColor: Colors.transparent, title: '元石'),
                  SizedBox(
                    height: 395.w,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Container(
                          width: 375.w,
                          child: ImageX(
                            type: ImageType.asset,
                            image: 'bg_original_stone.png'.imagePath,
                            fit: BoxFit.cover,
                          ).margin(horizontal: 15.w),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 42.w,
                            ),
                            Text(
                              '我的元石（个）',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: 2.skColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ).paddingSymmetric(horizontal: 32.w),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              TextUtil.formatDoubleComma3(
                                  '${logic.mineStoneBean?.mineNum ?? 0}'),
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: 2.skColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ).paddingSymmetric(horizontal: 32.w),
                            SizedBox(
                              height: 12.w,
                            ),
                            IntrinsicWidth(
                              child: Container(
                                alignment: Alignment.center,
                                color: 2.skColor.withOpacity(0.48),
                                height: 22.w,
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  '全平台元石总量上限10亿个',
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 10.sp,
                                    color: 2.skColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ).clipRRect(all: 11.w),
                            ).paddingSymmetric(horizontal: 32.w),
                            SizedBox(
                              height: 40.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '全平台元石数量',
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 14.sp,
                                    color: 1.skColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '较昨天',
                                      style: TextStyle(
                                        height: 1,
                                        fontSize: 12.sp,
                                        color: 9.skColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ).paddingSymmetric(horizontal: 24.w),
                            SizedBox(
                              height: 6.w,
                            ),
                            Text(
                              TextUtil.formatDoubleComma3(
                                  '${logic.mineStoneBean?.platformNum ?? 0}'),
                              style: TextStyle(
                                height: 1,
                                fontSize: 12.sp,
                                color: 9.skColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ).paddingSymmetric(horizontal: 24.w),
                            SizedBox(
                              height: 14.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.w),
                              width: double.infinity,
                              height: 150.w,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: LineChart(
                                mainData(),
                              ),
                            ).paddingSymmetric(horizontal: 19.w),
                          ],
                        ),
                        ImageX(
                          type: ImageType.asset,
                          image: 'icon_original_stone.png'.imagePath,
                          width: 146.w,
                          height: 146.w,
                        ).positioned(right: 0)
                      ],
                    ),
                  ),

                  SizedBox(height: 33.w,),
                  const CreatorItemView(
                    title: '元石说明',
                    desc:
                        '1.数字藏品为虚拟数字产品，而非实物，仅限实名认证为年满18周岁的中国大陆购买。数字藏品的版权有发行方。\n2.或者原创者拥有，数字藏品为虚拟数字产品，而非实物，\n3.仅限实名认证为年满18周岁的中国大陆购买。数字藏品的版权有发行方或者原创者拥有。',
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: logic.getSss()['gap'],
        verticalInterval: 1.w,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: 10.skColor,
            strokeWidth: 0.5.w,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: 20.skColor,
            strokeWidth: 0.5.w,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30.w,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: logic.getSss()['gap'],
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30.w,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: 0.skColor),
      ),
      minX: 0,
      maxX: logic.getSss()['x'],
      minY: 0,
      maxY: logic.getSss()['maxY'],
      lineBarsData: [
        LineChartBarData(
          spots: logic.spotList,
          isCurved: false,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),

          color: 0.skColor,
          barWidth: 2.w,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 2.1.w,
                color: Color.lerp(
                  2.skColor,
                  2.skColor,
                  percent / 100,
                )!,
                strokeColor: 0.skColor,
                strokeWidth: 0.7.w,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                0.skColor.withOpacity(0.3),
                0.skColor.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: 3.skColor,
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
    );
    Widget text;

    print(value);

    if (logic.platformList.isNotEmpty) {
      var item = logic.platformList[(value.toInt())];

      var res =
          DateUtil.formatDateStr(item.date ?? '', format: DateFormats.mo_d);

      text = Text(res, style: style);
    } else {
      text = Text('', style: style);
    }

    // text =  Text("$value", style: style);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 10.sp, color: 3.skColor);

    if (value >= 10000) {
      return Text("${(value / 10000).toStringAsFixed(1)}W",
          style: style); // 超过 10000 显示为 *W
    } else {
      return Text(value.toInt().toString(), style: style); // 否则直接显示整数
    }
  }
}
