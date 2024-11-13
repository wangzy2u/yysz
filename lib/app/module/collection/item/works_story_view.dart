import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../brand_details/bean/brand_collection_list_bean.dart';
import '../../brand_details/bean/collection_detail_bean.dart';

class WorksStoryView extends StatelessWidget {

  const WorksStoryView({super.key, this.collectionStorys});
  final List<String>? collectionStorys;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16.w),
      color: 2.skColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '作品故事',
            style: TextStyle(
                fontSize: 18.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w600),
          ).paddingSymmetric(horizontal: 12.w),
          SizedBox(height: 10.w,),
          if(collectionStorys != null)
          ...List.generate(collectionStorys!.length, (index) {
            return buildItem(collectionStorys![index]);
          })
        ],
      ),
    ).clipRRect(all: 16.w).marginSymmetric(horizontal: 15.w);
  }
  
  
  buildItem(String item){
    return ImageX.url(item ?? '',width: double.maxFinite,fit: BoxFit.fitWidth,);
  }
}
