import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../../common/index.dart';
import '../bean/Pay_register_state_bean.dart';
import '../bean/pay_order_bean.dart';
import '../logic.dart';

class PayMethodsDialog extends StatefulWidget {
  const PayMethodsDialog({super.key, this.orderBean, required this.payRegisterStateBean});

  final PayOrderBean? orderBean;
  final PayRegisterStateBean payRegisterStateBean;

  @override
  State<PayMethodsDialog> createState() => _PayMethodsDialogState();
}

class _PayMethodsDialogState extends State<PayMethodsDialog> {





  var logic = Get.find<OrderDetailLogic>();



  PayMethodsType? payMethodsType;


  @override
  void initState() {
    super.initState();

    //判断如果用户已开通易宝钱包则默认选中易宝钱包
    if(widget.payRegisterStateBean.yiabaoWalletStatus == 1){
      setState(() {
        payMethodsType = PayMethodsType.yibao;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          color: 2.skColor,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
          child: Column(
            children: [
              Text(
                '￥${widget.orderBean?.unitPrice.toString().toMoney() ?? ''}',
                style: TextStyle(
                    color: 1.skColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '选择支付方式',
                style: TextStyle(
                    color: 1.skColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 16.w,),

              Column(
                children: buildContent(),
              ),



              SizedBox(height: 20.w,),

              InkWell(
                onTap: (){
                  if(payMethodsType != null){
                    Get.back(result: payMethodsType);
                    // logic.payOrder(payMethodsType!);
                  }

                },
                child: Container(
                  height: 44.w,
                  color: 0.skColor,
                  child: Text('去支付',style: TextStyle(color: 2.skColor,fontSize: 14.sp,fontWeight: FontWeight.w500),).center(),
                ).clipRRect(all: 12.w),
              )
            ],
          ),
        ).clipRRect(topLeft: 16.w, topRight: 16.w)
      ],
    );
  }





  List<Widget> buildContent(){
    return PayMethodsType.values.map((e){
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
    if(widget.payRegisterStateBean.yiabaoWalletStatus == 1){
      return InkWell(
        onTap: (){
          setState(() {
            payMethodsType = PayMethodsType.yibao;
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
                logic.openEbao();
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

