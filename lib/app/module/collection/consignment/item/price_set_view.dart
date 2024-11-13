import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/widgets/text_input.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

class PriceSetView extends StatelessWidget {
  const PriceSetView({super.key, this.onChanged, required this.buyPrice});

  final ValueChanged<String>? onChanged;
  final String buyPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.w),
      color: 2.skColor,
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '设置售价',
                style: TextStyle(color: 1.skColor, fontSize: 18.sp,fontWeight: FontWeight.w500),
              ),


              Text(
                '你的买入价：$buyPrice',
                textAlign: TextAlign.center,
                style: TextStyle(color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
              )
            ],
          ),

          SizedBox(height: 12.w,),

          Container(
            height: 44.w,
            color: 4.skColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  '￥',
                  style: TextStyle(color: 1.skColor, fontSize: 18.sp,fontWeight: FontWeight.w400),
                ),

                Expanded(child:
                InputTextX(
                    hint:'请输入售价',
                  textAlign: TextAlign.center,
                  inputType: const TextInputType.numberWithOptions(),
                  onChanged: (text){

                      if(onChanged != null){
                        onChanged!(text);
                      }
                  },
                ))

              ],
            ),
          ).clipRRect(all: 7.w)

        ],
      ),
    ).clipRRect(all: 16.w).margin(horizontal: 15.w);
  }
}
