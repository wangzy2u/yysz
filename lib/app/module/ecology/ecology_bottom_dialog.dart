import 'package:flutter/material.dart';
import '../../../../common/index.dart';
import '../../../common/widgets/icon_x.dart';
import 'bean/eclolgy_filter_bean.dart';
import 'logic.dart';

class EcologyBottomDialog extends StatelessWidget {
  EcologyBottomDialog(String filterNameStr, {super.key});

  final EcologyLogic logic = Get.put(EcologyLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 256.h,
        color: Colors.white,
        // decoration: const BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.all(Radius.circular(16))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 20.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '选择发行方',
                      style: TextStyle(
                          color: 1.skColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    IconX.icon(
                      Icons.clear,
                      color: 1.skColor,
                      size: 18.w,
                    ).onTap(() {
                      Get.back(result: 0);
                    })
                  ],
                ),
              ),
              Container(
                // height: markEdit ? 330 : 280,
                // color: Colors.orange,
                child: GridView.builder(
                  itemCount: logic.ecologyFilterList.length + 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 40, // item总高度
                  ),
                  padding: EdgeInsets.only(top: 16.w, left: 15.w, right: 15.w),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        logic.pageNum = 1;
                        String? idStr = '';
                        if (index > 0) {
                          EclolgyFilterItemBean item =
                              logic.ecologyFilterList[index - 1];
                          idStr = item.id;
                          logic.currentIssuerId = idStr ?? '';
                          logic.getEcologyList();
                          Get.back(result: index);
                          return;
                        }
                        logic.currentIssuerId = idStr;
                        logic.getEcologyList();
                        Get.back(result: index);
                      },
                      child: _gridItemView(index, Map()),
                    );
                  },
                ),
              ),
              // InkWell(
              //   onTap: (){
              //     Get.back(result: 1);
              //   },
              //   child:SizedBox(height: 290.w,
              //     child: Text('anniu1'),
              //   ) ,
              // ),
              //
              // SizedBox(height: 290.w,
              //   child: Text('anniu2'),
              // ).onTap((){
              //   Get.back(result: 2);
              // })
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridItemView(int index, Map data) {
    // tagList = data['tag'].split('，');
    EclolgyFilterItemBean item = EclolgyFilterItemBean();
    if (index > 0) {
      item = logic.ecologyFilterList[index - 1];
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(0, 0, 0, 0.1), //阴影颜色
          //     offset: Offset(0, 0), //阴影位置
          //     blurRadius: 1, //阴影模糊层度
          //     spreadRadius: 0.2, //阴影模糊大小
          //   ),
          // ],
          // 0.skColor
          color: (index == 0 && logic.filterNameStr == '全部品牌')
              ? 0.skColor
              : (logic.filterNameStr == '${item.name}')
                  ? 0.skColor
                  : 5.skColor),
      // child: Center(child: Text('全部作者', style: TextStyle(color: 2.skColor),),),
      child: Center(
        child: (index == 0)
            ? Text('全部品牌',
                style: TextStyle(
                    color: (index == 0 && logic.filterNameStr == '全部品牌')
                        ? 2.skColor
                        : 9.skColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp))
            : Text(
                '${item.name}',
                style: TextStyle(
                    color: logic.filterNameStr == item.name
                        ? 2.skColor
                        : 9.skColor,
                    fontWeight: FontWeight.w600,
                fontSize: 14.sp),
              ),
      ),
    );
  }
}
