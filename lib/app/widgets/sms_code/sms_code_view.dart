import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_flutter/app/widgets/sms_code/count_down_logic.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

import '../../../common/index.dart';

class SmsCodeView extends StatelessWidget {
   SmsCodeView({super.key, required this.onPressed, this.title, this.hint, this.onChanged, this.focusChanged, this.inputType, this.inputFormatter, this.maxLength, this.hintColor, this.textColor});
  final  Function() onPressed;

  final String? title;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final TextInputType? inputType;
  final int? maxLength;
  final Color? hintColor;
  final Color? textColor;
  final List<TextInputFormatter> ? inputFormatter;


  var controller = Get.put(CountDownLogic());

  @override
  Widget build(BuildContext context) {
    return _input();
  }


  _input() {
    return Container(
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(width: 1.w,color: IColors.colore3e3e3))
        // ),
        child: Row(
          children: [
            Expanded(child: TextField(
              onChanged: onChanged,
              // obscureText: obscureText,
              keyboardType: inputType,
              inputFormatters: inputFormatter ?? [],
              // autofocus: obscureText,
              maxLength: maxLength ?? 6,
              // cursorColor: primary,
              style: TextStyle(
                  fontSize: 14.w,
                  color: textColor ?? 1.skColor,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                counterText: "",
                // contentPadding: EdgeInsets.only(left: 25, right: 25),
                border: InputBorder.none,
                hintText: hint ?? '',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: hintColor ?? 3.skColor,
                    fontWeight: FontWeight.w400),
              ),
            )),
            Obx((){
              return InkWell(
                onTap: () async {
                  onPressed.call();
                },
                child: Text(controller.smsBtnStr.value,style: TextStyle(
                    fontSize: 14.sp,
                    color: 0.skColor,
                    fontWeight: FontWeight.w400
                ),),
              );
            })

          ],
        ));
  }
}
