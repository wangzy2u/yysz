

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

class CustomFooter extends Footer{
  CustomFooter({required super.triggerOffset, required super.clamping});

  @override
  Widget build(BuildContext context, IndicatorState state) {


    switch(state.result){

      case IndicatorResult.noMore:
        return Container(
          height: state.offset,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text('--- 没有更多了 ---',style: TextStyle(color: 3.skColor,fontSize: 13.sp),),
        );



      case IndicatorResult.none:
      case IndicatorResult.success:
      case IndicatorResult.fail:
      return Stack(
        children: [
          SizedBox(
            height: state.offset,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 40,
              child: SpinKitCircle(
                size: 24,
                color: 0.skColor,
              ),
            ),
          )
        ],
      );
    }

  }
  
}