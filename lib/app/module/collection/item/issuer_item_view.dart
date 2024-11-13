

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/index.dart';

import '../../../../common/widgets/icon_x.dart';
import '../../../../common/widgets/image_x.dart';

///藏品详情页面---》发行方
class IssuerItemView extends StatelessWidget {

  const IssuerItemView({super.key,  this.title,  this.subTitle,  this.imgUrl});

  final String ?title;
  final String ?subTitle;
  final String ?imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      padding: EdgeInsets.all(12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Row(


            children: [
              ImageX.url(imgUrl ?? '',width: 38.w,height: 38.w,radius: 31.w,fit: BoxFit.cover,),

              SizedBox(width: 8.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${title}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4.w,),
                  Text(
                    subTitle ?? '',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: 3.skColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )

            ],
          ),
          
          
          
          
          IconX.icon(Icons.arrow_forward_ios,color: 3.skColor,size: 15.w,)





          

        ],
      ),
    ).clipRRect(all: 16.w).clipRRect(all: 16.w).marginSymmetric(horizontal: 15.w);;
  }
}
