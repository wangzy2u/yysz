

//大厅筛选框
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../common/index.dart';
import '../../home/bean/Issuer_list_bean.dart';

class HallFilterDialog extends StatelessWidget {
  const HallFilterDialog({super.key, required this.issuerList, required this.selectIndex});
  final List<IssuerItemBean> issuerList;
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      height: 256.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.w),
      child: SingleChildScrollView(
        child: Column(

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('选择发行方', style: TextStyle(color: 1.skColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
              IconX.icon(Icons.clear,color: 1.skColor,size: 18.w,).onTap((){
                Get.back(result: 0);
              })
            ],),

            SizedBox(height: 16.w,),
            GridView.builder(
              itemCount: issuerList.length + 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
               SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.w,
                mainAxisExtent: 40.w, // item总高度
              ),
              itemBuilder: (context, index) {
                if(index == 0){
                  return InkWell(
                    onTap: (){
                      Get.back(result: index);
                    },
                    child: buildItem(null, selectIndex == index),
                  );
                }
                return InkWell(
                  onTap: (){
                    Get.back(result: index);
                  },
                  child: buildItem(issuerList[index - 1], selectIndex == index),
                );
              },
            )



          ],

        ),
      ),
    ).clipRRect(topLeft: 16.w,topRight: 16.w);
  }
  
  
  buildItem(IssuerItemBean ? item,bool isSelect){
    if(item == null){
      return Container(
        color: isSelect ? 0.skColor : 5.skColor,
        alignment: Alignment.center,
        child: Text('全部品牌',style: TextStyle(color: isSelect ? 2.skColor : 1.skColor,fontSize: 14.w,fontWeight: FontWeight.w500),),
      ).clipRRect(all: 20.w);
    }else{
      return Container(
        color: isSelect ? 0.skColor : 5.skColor,
        alignment: Alignment.center,
        child: Text(item.name ?? '',style: TextStyle(color: isSelect ? 2.skColor : 1.skColor,fontSize: 14.w,fontWeight: FontWeight.w500),),
      ).clipRRect(all: 20.w);
    }
  }
}
