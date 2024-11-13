import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

class ItemCardView extends StatelessWidget {
  const ItemCardView({super.key, required this.title, required this.subTitle, required this.image});

  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ImageX.url(image,width: 44.w,height: 44.w,placeholder: ImageX(type: ImageType.asset,image: 'about_icon.png'.imagePath,),),

        SizedBox(height: 8.w,),
        Text(title, style: TextStyle(
          fontSize: 14.sp,
          color: 1.skColor,
          fontWeight: FontWeight.w500,
        ),),
        SizedBox(height: 2.w,),
        Text(subTitle, style: TextStyle(
          fontSize: 12.sp,
          color: 3.skColor,
          fontWeight: FontWeight.w400,
        ),),
        SizedBox(height: 12.w,),
      ],
    );
  }
}
