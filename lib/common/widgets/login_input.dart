import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

///登录、注册界面输入框组件
class LoginInput extends StatefulWidget {
  final String? title;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType? inputType;
  final TextEditingController ? textEditingController;
  final List<TextInputFormatter> ? inputFormatter;

  const LoginInput(
      {Key? key,
      this.title,
      this.hint,
      this.onChanged,
      this.focusChanged,
        this.textEditingController,
      this.lineStretch = false,
      this.obscureText = false,
        this.inputFormatter,
      this.inputType})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

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
        child: TextField(
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter ?? [],
      autofocus: widget.obscureText,
      maxLength: 11,
      controller: widget.textEditingController,
      // cursorColor: primary,
      style: TextStyle(
          fontSize: 14.sp,
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
    ));
  }
}
