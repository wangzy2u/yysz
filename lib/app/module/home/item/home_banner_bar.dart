
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/banner_widget.dart';
import '../logic.dart';
import 'home_notice_bar.dart';

///首页banner
class HomeBannerBar extends StatelessWidget{
  const HomeBannerBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [2.skColor, 22.skColor], // 渐变的颜色数组
            begin: Alignment.topCenter, // 渐变开始的方向
            end: Alignment.bottomCenter, // 渐变结束的方向
          ),
        ),
        child: Container(
          color: 2.skColor,
          child: Column(
            children: [
              GetBuilder<HomeLogic>(
                  id: 'homeBanner',
                  builder: (logic) {
                    return BannerBar(
                      banners: logic.bannerList,
                    );
                  }),
      
              const HomeNoticeBar(),
      
            ],
          ),
        ).clipRRect(all: 16.w).marginOnly(left: 8.w,right: 8.w,top: 16.w),
      ),
    );
  }
}
