
import 'dart:convert';

import 'package:flutter/services.dart';

class CopyUtil{
  //复制文本
  static Future<void> copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  //复制图片
  static Future<void> copyImage(Uint8List imageBytes) async {

    // 将图片转换为 base64 字符串
    final String base64Image = base64Encode(imageBytes);

    // 复制 base64 图片字符串到剪切板
    await Clipboard.setData(ClipboardData(text: base64Image));;
  }
}