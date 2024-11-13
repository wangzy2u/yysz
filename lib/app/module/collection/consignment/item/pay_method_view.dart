

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/buy/order_detail_page/logic.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../buy/order_detail_page/bean/Pay_register_state_bean.dart';

class PayMethodView extends StatefulWidget {
  const PayMethodView({super.key, this.payMethodsType, required this.isOpenEbao, this.onChanged, this.onOpenTab});
  final PayMethodsType? payMethodsType;
  final bool isOpenEbao;
  final ValueChanged<PayMethodsType>? onChanged;
  final Function ? onOpenTab;
  @override
  State<PayMethodView> createState() => _PayMethodViewState();
}

class _PayMethodViewState extends State<PayMethodView> {

  PayMethodsType? payMethodsType;

  @override
  void initState() {
    super.initState();
    payMethodsType = widget.payMethodsType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildContent(),
    );
  }


  List<Widget> buildContent(){

    List<PayMethodsType> filteredEnums = PayMethodsType.values.where((e) => e != PayMethodsType.yibaoFast).toList();

    return filteredEnums.map((e){
      return buildItem(e).marginOnly(top: 12.w);

    }).toList();
  }
  Widget buildItem(PayMethodsType type){
    switch(type){

      case PayMethodsType.yibao:

        return eBaoPayItem();

      case PayMethodsType.yibaoFast:
        return eBaoFastPay();

    }
  }

  eBaoFastPay(){
    return InkWell(
      onTap: (){
        setState(() {
          payMethodsType = PayMethodsType.yibaoFast;

          if(widget.onChanged != null){
            widget.onChanged!(PayMethodsType.yibaoFast);
          }
        });
      },
      child: Container(
        color: 23.skColor,
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            Row(
              children: [
                ImageX.asset('icon_ebao_pay.png'.skImagePath,height: 44.w,width: 44.w,).clipOval(),
                SizedBox(width: 12.w,),
                Text(
                  '易宝快捷支付',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),



            Container(
              padding: EdgeInsets.all(5.w),
              child: IconX.icon((payMethodsType != null && payMethodsType == PayMethodsType.yibaoFast)
                  ? Icons.check_circle
                  : Icons.circle_outlined,
                color: (payMethodsType != null && payMethodsType == PayMethodsType.yibaoFast) ? 0.skColor : 2
                    .skColor, size: 20.w,),
            )


          ],
        ),

      ).clipRRect(all: 16.w),
    );
  }

  eBaoPayItem(){
    if(widget.isOpenEbao){
      return InkWell(
        onTap: (){
          setState(() {
            payMethodsType = PayMethodsType.yibao;
            if(widget.onChanged != null){
              widget.onChanged!(PayMethodsType.yibao);
            }
          });
        },
        child: Container(
          color: 23.skColor,
          padding: EdgeInsets.all(16.w),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Row(
                children: [
                  ImageX.asset('icon_ebao_pay.png'.skImagePath,height: 44.w,width: 44.w,).clipOval(),
                  SizedBox(width: 12.w,),
                  Text(
                    '易宝钱包',
                    style: TextStyle(
                        color: 1.skColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),




              Container(
                padding: EdgeInsets.all(5.w),
                child: IconX.icon((payMethodsType != null && payMethodsType == PayMethodsType.yibao)
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                  color: (payMethodsType != null && payMethodsType == PayMethodsType.yibao) ? 0.skColor : 2
                      .skColor, size: 20.w,),
              )

            ],
          ),

        ).clipRRect(all: 16.w),
      );
    }else{
      return Container(
        color: 23.skColor,
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            Row(
              children: [
                ImageX.asset('icon_ebao_pay.png'.skImagePath,height: 44.w,width: 44.w,).clipOval(),
                SizedBox(width: 12.w,),
                Text(
                  '易宝钱包',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),



            InkWell(
              onTap: (){
                // logic.openEbao();
              },
              child: Container(
                color: 25.skColor,
                padding: EdgeInsets.symmetric(vertical: 6.w,horizontal: 12.w),
                child: Text('立即开通',style: TextStyle(color: 2.skColor,fontSize: 12.sp,fontWeight: FontWeight.w500),),

              ).clipRRect(all:20.w),
            )


          ],
        ),

      ).clipRRect(all: 16.w);
    }

  }
}
