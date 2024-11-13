import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/index.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app/module/home/bean/banner_bean.dart';


class BannerBar extends StatefulWidget {
  final List<BannerBean> banners;

  const BannerBar({Key? key, required this.banners}) : super(key: key);

  @override
  State<BannerBar> createState() => _BannerBarState();
}

class _BannerBarState extends State<BannerBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.banners.isNotEmpty && widget.banners.length == 1) {
      return SizedBox(
        height: 146.w,
        child: BannerItem(
          model: widget.banners.first,
        ),
      ).clipRRect(topRight: 16.w,topLeft: 16.w);
    }

    return SizedBox(
      height: 144.w,

      child: Swiper(
        duration: 1000,
        autoplayDelay: 4000,
        autoplay: widget.banners.isNotEmpty,
        itemBuilder: (BuildContext context, int index) {
          return BannerItem(model: widget.banners[index]);
        },
        itemCount: widget.banners.length,
        //轮播分页器
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 7.w),
          builder: RectSwiperPaginationBuilder(
            size: Size(13.0.w, 13.0.w),
            activeSize: Size(20.0.w, 13.0.w),
            activeColor: 0.skColor,
            color: 2.skColor.withOpacity(0.5),
            space: 4.w,
          ),
        ),
      ),
    ).clipRRect(topRight: 16.w,topLeft: 16.w);
  }
}

class BannerItem extends StatelessWidget {
  final BannerBean model;

  const BannerItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {


        if(model.clickDealWay == '1'){
          print('纯展示');
        }else if(model.clickDealWay == '2'){
            Get.toNamed(
              AppRoutes.webView,
              parameters: {
                'url': model.link ?? '',
                'isShowBar': '1',
              },
            );
        }else if(model.clickDealWay == '3'){
           launchUrlString(model.link ?? '');
        }{

        }
        
      },
      child: Container(

        // color: Colors.red,
        width: double.infinity,
        // padding: EdgeInsets.only(top: 10.w,bottom: 30.w),
        child: ImageX.url(model.cover ?? '',height: 144.w,width: double.infinity,fit: BoxFit.cover).clipRRect(topLeft: 16.w,topRight: 16.w),
      ),
    );
  }
}
