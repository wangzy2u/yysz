

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/icon_x.dart';

///购买数量弹窗
class BuyNumDialog extends StatefulWidget {


  final int maxNum;
  const BuyNumDialog({super.key, required this.maxNum});

  @override
  State<BuyNumDialog> createState() => _BuyNumDialogState();
}

class _BuyNumDialogState extends State<BuyNumDialog> {

  final searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    searchController.text = '1';


    // 添加监听器，检测输入的值
    searchController.addListener(() {

      final text = searchController.text;

      // 检查输入的内容并设置最小和最大值
      if (text.isNotEmpty) {
        final value = int.tryParse(text);

        if (value != null) {
          if (value < 1) {
            searchController.text = '1';
          } else if (value > widget.maxNum) {
            searchController.text = '${widget.maxNum}';
          }

          // 确保光标在文本末尾
          searchController.selection = TextSelection.fromPosition(
            TextPosition(offset: searchController.text.length),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      height: 232.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('选择购买数量', style: TextStyle(color: 1.skColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
              IconX.icon(Icons.clear,color: 1.skColor,size: 18.w,).onTap((){
                Get.back(result: 0);
              }),

            ],),

          SizedBox(height: 16.w,),

          Container(
            height: 44.w,
            color: 4.skColor,
            width: double.infinity,
            child:Row(
              children: [

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('—',style: TextStyle(color: 1.skColor, fontSize: 16.sp, fontWeight: FontWeight.w600),),
                ).onTap((){if(searchController.text.isNotEmpty){
                  int temp = searchController.text.toInt() ?? 1;

                  if(temp > 1){
                    temp = temp - 1;
                  }else{
                    temp = 1;
                  }

                  searchController.text = '$temp';

                  setState(() {

                  });
                }}),


                Expanded(
                  child: SizedBox(
                    height: 44.w,
                    child: TextField(
                      autofocus: false,
                      controller: searchController,
                      // focusNode: accountFn,
                      textInputAction: TextInputAction.none,

                      inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: 1.skColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(fontSize: 16.sp, color: 1.skColor),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: -10, horizontal: -10),
                        border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                        counterText: "",
                      ),

                      onSubmitted: (String str) {
                        // logic.saveSearchWord(str);
                        // Get.toNamed(Routes.searchResultPage, arguments: str);
                        // focusFn ??= FocusScope.of(context);
                        // focusFn?.requestFocus(imageCodeFn);
                      },
                    ),
                  ),
                ),

                Container(
                  child:IconX.icon(Icons.add,color: 1.skColor,size: 19.w,) ,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                ).onTap((){

                  if(searchController.text.isNotEmpty){
                    int temp = searchController.text.toInt() ?? 1;
                    temp = temp + 1;
                    searchController.text = '$temp';

                    setState(() {

                    });
                  }

                }),
              ],
            ),
          ).clipRRect(all:8.w),


          SizedBox(height: 8.w,),
          Text('可购买数量:${widget.maxNum}', style: TextStyle(color: 1.skColor, fontSize: 14.sp, fontWeight: FontWeight.w400),),

          SizedBox(height: 20.w,),
          Container(
            color: 0.skColor,
            height: 44.w,
            width: double.infinity,
            child: Text('立即购买',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

          ).clipRRect(all: 8.w).onTap((){
            Get.back(result: searchController.text);
          })
        ],
      ),
    ).clipRRect(topLeft: 16.w,topRight: 16.w);
  }
}

