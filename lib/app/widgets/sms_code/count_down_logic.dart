import 'dart:async';

import 'package:get/get.dart';

class CountDownLogic extends GetxController {
  var seconds = 0;
  final smsBtnStr = '获取验证码'.obs;
  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    stop();
  }

  bool get isActive => (timer != null && timer!.isActive);

  void start(int countDownSeconds) {
    stop();

    seconds = countDownSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds -= 1;
        smsBtnStr.value = '${seconds}s';
      } else {
        timer.cancel();
        smsBtnStr.value = '重新获取';
      }
      update();
    });
  }

  void stop() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
  }
}
