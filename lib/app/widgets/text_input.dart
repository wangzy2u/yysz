import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

class InputTextX extends StatelessWidget {
  const InputTextX(
      {super.key,
      this.hint,
      this.onChanged,
      this.inputType,
      this.inputFormatter,
      this.height, this.textAlign, this.maxLength, this.obscureText, this.hintColor, this.textColor});

  final String? hint;
  final double? height;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final int? maxLength;
  final bool? obscureText;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatter;
  final Color? hintColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 44.w,
      child: TextField(
        autofocus: false,
        textAlign: textAlign ?? TextAlign.start,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        keyboardType: inputType,
        maxLength:  maxLength ?? 100,
        inputFormatters: inputFormatter ?? [],
        // focusNode: accountFn,
        textInputAction: TextInputAction.done,
        style: TextStyle(
            color: textColor ?? 1.skColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint ?? '',
          hintStyle: TextStyle(fontSize: 14.sp, color: hintColor ?? 3.skColor,fontWeight: FontWeight.w400),
          // contentPadding:
          //     EdgeInsets.symmetric(vertical: -10, horizontal: -10),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
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
    );
  }
}
