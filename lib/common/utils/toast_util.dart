

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ToastUtil{
  static void showToast(String ? content){
    SmartDialog.showToast(content ?? '');
  }
}