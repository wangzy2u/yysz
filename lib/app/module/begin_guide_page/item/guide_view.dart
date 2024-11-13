import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/widgets/video/video_play_view.dart';
import '../bean/Tutorial_item_bean.dart';
import '../logic.dart';

class GuideView extends StatelessWidget {
  const GuideView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeginGuideLogic>(
        id: 'GuideView',
        builder: (logic) {

          if(logic.guideList.isEmpty){
            return const EmptyView();
          }

          return ListView.builder(
              itemCount: logic.guideList.length,
              itemBuilder: (context, index) {
                return buildItem(logic.guideList[index]);
              });
        });
  }


  buildItem(TutorialItemBean item){
    return Container(
      height: 180.w,
      color: 1.skColor,
      child:  Stack(
          // alignment: FractionalOffset.bottomRight +
          //     const FractionalOffset(-0.1, -0.1),
          children: <Widget>[
            VideoPlayView(url: item.videoUrl ?? '',height: 180.w,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title ?? '',
                  style: TextStyle(
                      color: 2.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${item.views ?? 0}次播放',
                  style: TextStyle(
                      color: 34.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
                .height(44.w)
                .padding(horizontal: 14.w)
                .frostedGlass(bgColor: 1.skColor.withOpacity(0.4))
                .clipRRect(bottomLeft: 16.w, bottomRight: 16.w).positioned(bottom: 0,left: 0,right: 0)
          ]),
    ).clipRRect(all: 16.w).margin(top: 15.w,left: 15.w,right: 15.w);
  }
}





