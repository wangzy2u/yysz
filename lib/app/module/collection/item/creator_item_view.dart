

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/widgets/image_x.dart';

///创作者信息
class CreatorItemView extends StatelessWidget {

  const CreatorItemView({super.key, this.title, this.desc});

  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: 2.skColor,
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: TextStyle(
                fontSize: 18.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.w,),
          Text(
            '${desc}',
            style: TextStyle(
                fontSize: 14.sp,
                color: 3.skColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ).clipRRect(all: 16.w).marginSymmetric(horizontal: 15.w);
  }
}
