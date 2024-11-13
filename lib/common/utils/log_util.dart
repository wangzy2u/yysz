import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/**
 * @author: Kxmrg
 * @github: https://github.com/Kxmrg
 * @version: 1.0.0
 * @copyright: Copyright © 2023-2024 Kxmrg
 * @license: MIT License
 * @date: 2024-06-28
 * @description: 
 */

///日志工具
class LoggerUtil {
  static String _tag = 'Logger';
  static String _networkTag = 'Dio';

  static var log = Logger();

  static void init(bool isDebug, String? tag, String? networkTag) {
    _tag = tag ?? 'Logger';
    _networkTag = networkTag ?? 'Dio';
  }

  static void d(String message, [String? tag]) {
    if (kDebugMode) {
      log.d('${tag ?? ''} $message');
    }
  }
  static void e(Object message, [String? tag]) {
    if (kDebugMode) {
      log.e('${tag ?? ''} $message');
    }
  }

  static void network(String message, [String? tag]) {
    if (kDebugMode) {
      log.d('${tag ?? ''} $message');
    }
  }
}
