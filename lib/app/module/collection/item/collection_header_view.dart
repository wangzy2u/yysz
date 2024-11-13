import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/utils/text_util.dart';
import '../../../../common/widgets/image_x.dart';
import '../../brand_details/bean/brand_collection_list_bean.dart';
import '../../brand_details/bean/collection_detail_bean.dart';

///藏品详情头部view
class CollectionHeaderView extends StatelessWidget {
  const CollectionHeaderView({super.key, this.cover, this.background});

  final String? cover;
  final String? background;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 552.w,
          child: Stack(
            children: [
              ImageX(
                type: ImageType.network,
                image: background ?? '',
                height: 552.w,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
              ).frostedGlass(bgColor: 1.skColor.withOpacity(0)),
              Positioned(
                  top: kToolbarHeight + kTextTabBarHeight + 20,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ImageX.url(
                            cover ?? '',
                            width: 260.w,
                            height: 260.w,
                            radius: 20.w,
                            fit: BoxFit.cover,
                          )
                              .paddingAll(1.w)
                              .border(color: 2.skColor, all: 1.w, radius: 20.w)
                              .center(),
                          SizedBox(
                            height: 260.w,
                            child: ModelViewer(
                              backgroundColor: Colors.transparent,
                              src: 'RobotExpressive.glb'.imagePath,
                              alt: 'A 3D model of an astronaut',
                              ar: false,
                              autoRotate: true,
                              iosSrc:
                                  'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                              disableZoom: true,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.w,
                      ),
                      ImageX.asset(
                        'icon_collection_bottom.png'.skImagePath,
                        height: 159.w,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

//标签
buildTag({String? key, String? value}) {
  return Container(
    padding: EdgeInsets.only(left: 5.w),
    height: 20.w,
    width: 84.w,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [12.skColor, 13.skColor], // 渐变的颜色数组
        begin: Alignment.centerLeft, // 渐变开始的方向
        end: Alignment.centerRight, // 渐变结束的方向
      ),
    ),
    child: Stack(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              key ?? '',
              style: TextStyle(color: 2.skColor, fontSize: 12.sp),
            )),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 48.w,
            alignment: Alignment.center,
            color: 14.skColor,
            child: Text(
              '$value份',
              style: TextStyle(color: 0.skColor, fontSize: 12.sp),
            ),
          ).clipRRect(topLeft: 6.w, bottomLeft: 0),
        )
      ],
    ),
  ).clipRRect(all: 6.w);
}
