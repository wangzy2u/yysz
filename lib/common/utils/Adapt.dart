import 'dart:ui';

import 'package:flutter/material.dart';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static final double _width = mediaQuery.size.width;
  static final double _height = mediaQuery.size.height;
  static final double _topbarH = mediaQuery.padding.top;
  static final double _botbarH = mediaQuery.padding.bottom;
  static final double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;
  static var _rh;

  static double kToolbarHeight = 56.0;
  static double kBottomNavigationBarHeight = 56.0;

  /// 安全内容高度(包含 AppBar 和 BottomNavigationBar 高度)，包含导航栏和标签栏
  static double get safeContentHeight => _height - _topbarH - _botbarH;

  /// 仅没有tabBar的安全高度，没有tabBar高度
  static double get safeNoToolbarHeight => safeContentHeight - kToolbarHeight;

  /// 实际的安全高度，没有导航栏和标签栏
  static double get safeHeight =>
      safeContentHeight - kToolbarHeight - kBottomNavigationBarHeight;

  static double safeWidth = _width;

  static init(var context) {
    var size = MediaQuery.of(context).size;
    // _ratio = size.width / 750;
    // _rh = size.height / 1334;
    _ratio = size.width / 1080;
    _rh = size.height / 1920;
  }

  static px(number) {
    return number * _ratio;
  }

  static rWidth(number) {
    return number * _ratio;
  }

  static rHeight(number) {
    return number * _rh;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }
}

adaptrWidth(number) {
  return number * Adapt._ratio;
}

adaptrHeight(number) {
  return number * Adapt._rh;
}

adaptpx(number) {
  return number * Adapt._ratio;
}
