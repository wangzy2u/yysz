import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

import '../module/user/login/logic.dart';


///验证码输入框组件
class SmsInput extends StatefulWidget {
  final String? title;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType? inputType;
  final List<TextInputFormatter> ? inputFormatter;

  const SmsInput(
      {Key? key,
        this.title,
        this.hint,
        this.onChanged,
        this.focusChanged,
        this.lineStretch = false,
        this.obscureText = false,
        this.inputType, this.inputFormatter})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<SmsInput> {
  final _focusNode = FocusNode();
  final logic = Get.find<LoginLogic>();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _input();
  }

  _input() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(width: 1.w,color: IColors.colore3e3e3))
        // ),
        child: Row(
          children: [
            Expanded(child: TextField(
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText,
              keyboardType: widget.inputType,
              inputFormatters: widget.inputFormatter ?? [],
              autofocus: widget.obscureText,
              maxLength: 6,
              // cursorColor: primary,
              style: TextStyle(
                  fontSize: 14.w,
                  color: 1.skColor,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                counterText: "",
                // contentPadding: EdgeInsets.only(left: 25, right: 25),
                border: InputBorder.none,
                hintText: widget.hint ?? '',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: 3.skColor,
                    fontWeight: FontWeight.w400),
              ),
            )),
            Obx((){
              return InkWell(
                onTap: (){
                  logic.sendSms();
                },
                child: Text(logic.smsBtnStr.value,style: TextStyle(
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
