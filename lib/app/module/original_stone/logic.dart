import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/public_api.dart';
import 'package:nft_flutter/common/http/http/src/http_exceptions.dart';

import '../../network/network_manager.dart';
import 'bean/mine_stone_bean.dart';
import 'bean/stone_platform_bean.dart';

class OriginalStoneLogic extends GetxController {
  MineStoneBean? mineStoneBean;

  List<StonePlatformListBean> platformList = [];

  List<FlSpot> spotList = [];

  @override
  void onReady() {
    super.onReady();

    getMemberCard();

    showPlatform();
  }

  void getMemberCard() async {
    try {
      var res = await NetworkManager().findMineStone();

      if (res.success) {
        mineStoneBean = MineStoneBean.fromJson(res.data);
      }
    } on DMRequestException catch (e) {
      // ToastUtil.showToast(e.msg);
    }
    update();
  }

  void showPlatform() async {
    try {
      var res = await NetworkManager().showPlatform();

      if (res.success) {
        platformList.clear();
        spotList.clear();
        if (res.data != null) {
          res.data.forEach((value) {
            platformList.add(StonePlatformListBean.fromJson(value));
          });
        }

        for (int i = 0; i < platformList.length; i++) {
          spotList
              .add(FlSpot(i.toDouble(), (platformList[i].num ?? 0).toDouble()));
        }
      }
    } on DMRequestException catch (e) {
      // ToastUtil.showToast(e.msg);
    }
    update();
  }


  Map<String,double> getSss(){

    Map<String,double> result = {};
    if (platformList.isEmpty) {
      result['x'] = 8;
      result['y'] = 5;
      result['gap'] = 100000;
    }else{
      // 获取最大值，并将其放大 120%
      double maxValue = platformList.map((item) => item.num as double).reduce((a, b) => a > b ? a : b);
      double expandedMax = maxValue * 1.2;

      // 将 expandedMax 向上取整到最接近的万、千或百
      double maxY;
      if (expandedMax >= 10000) {
        maxY = (expandedMax / 10000).ceil() * 10000;
      } else if (expandedMax >= 1000) {
        maxY = (expandedMax / 1000).ceil() * 1000;
      } else {
        maxY = (expandedMax / 100).ceil() * 100;
      }



// 获取最小值
      double minY = platformList.map((item) => item.num as double).reduce((a, b) => a < b ? a : b);


      // 3. 计算 Y 轴的间隔
      double interval = (maxY) / 4;

      result['x'] = (platformList.isNotEmpty ? platformList.length - 1 : 7).toDouble();

      if(maxY <= 0){
        maxY = 5;
      }
      result['maxY'] = maxY;

      result['minY'] = minY;
      if(interval <= 0){
        interval = 1;
      }
      result['gap'] = interval;
    }
    return result;




  }

  double getMaxY() {
    if (platformList.isEmpty) {
      return 10;
    }

    // 提取 num 的最大值和最小值
    double maxValue = platformList
        .map((item) => item.num as double)
        .reduce((a, b) => a > b ? a : b);

    maxValue + 10;

    return maxValue;
  }

  double getMaxX() {
    return (platformList.isNotEmpty ? platformList.length - 1 : 7).toDouble();
  }

  double getGap() {
    if (platformList.isEmpty) {
      return 1;
    }

    // 提取 num 值的最大值和最小值
    double maxValue = platformList
        .map((item) => item.num as double)
        .reduce((a, b) => a > b ? a : b);
    double minValue = platformList
        .map((item) => item.num as double)
        .reduce((a, b) => a < b ? a : b);

    // 计算 Y 轴刻度间距
    double range = maxValue - minValue;
    double interval = range / 4; // 将范围均分成 4 个间隔，得到 5 个刻度

    return interval;
  }
}
