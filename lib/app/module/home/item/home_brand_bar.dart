


import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/index.dart';

import '../../../../common/res/langs/text_key.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../../common/widgets/keep_alive_wrapper.dart';
import '../../../routes/app_routes.dart';
import '../logic.dart';

///首页品牌卡片
class HomeBrandBar extends StatelessWidget {
  const HomeBrandBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    TextKey.partnerBrands.tr,
                    style: TextStyle(
                        color: 1.skColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ).padding(horizontal: 8.w),
                SizedBox(
                  height: 12.w,
                ),
                Container(
                  width: double.infinity,
                  height: 251.w,
                  child: GetBuilder<HomeLogic>(
                      id: 'issuerList',
                      builder: (logic) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            height: 251.w,
                            viewportFraction:0.54,
                            enlargeCenterPage: true,
                          ),
                          items: logic.issuerList
                              .map((item) => KeepAliveWrapper(
                            keepAlive: true,
                            child: SizedBox(
                              height: 249.w,
                              child: Stack(
                                children: [
                                  ImageX.url(
                                    item.cover ?? '',
                                    height: 249.w,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                    radius: 20.w,
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 1,
                                    child: SizedBox(
                                      height:85.w,
                                      width: double.infinity,
                                    ).frostedGlass(bgColor: 1.skColor.withOpacity(0.12)).clipRRect(all: 12.w),
                                  ),
                                  Positioned(
                                      left: 12.w,
                                      right: 12.w,
                                      bottom: 15.w,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              ImageX.url(
                                                item.logo ??
                                                    '',
                                                height: 40.w,
                                                width: 40.w,
                                                radius: 5.w,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                item.name ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: 1.skColor),
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 44.w,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              item.introduce ?? '',
                                              maxLines: 2, // 设置最大行数为 2
                                              overflow: TextOverflow.ellipsis, // 超出后显示省略号
                                              style: TextStyle(

                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: 9.skColor),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ).onTap(() {
                              Get.toNamed(AppRoutes.brandDetailsPage, arguments: {
                                'id': item.id,
                              });
                            }),
                          ))
                              .toList(),
                        );

                      }),
                ),
              ],
            ),
      
          ],
        ),
      ).marginOnly(top: 20.w,bottom: 24.w),
    );
  }




}
