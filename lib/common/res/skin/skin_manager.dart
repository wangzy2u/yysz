import 'package:flutter/material.dart';
import 'package:nft_flutter/app/data/global_service.dart';

import '../../utils/sp_util.dart';
import 'color_library.dart';

const kSkinLocalKey = 'skin_local_key';
const kDarkSkin = 'dark';
const kLightSkin = 'light';

class SkinManager {
  static final SkinManager _instance = SkinManager._init();

  String currentSkin = kLightSkin;

  SkinManager._init() {
    currentSkin = SpUtil.getString(kSkinLocalKey, defValue: kLightSkin) ?? kLightSkin;
  }

  factory SkinManager() {
    return _instance;
  }

  static setSkin(String skin) {
    if (skin != _instance.currentSkin) {
      SpUtil.putString(kSkinLocalKey, skin);
      _instance.currentSkin = skin;
    }
  }

  String get skImagePath => 'assets/skin/$currentSkin/images/';
  String get imagePath => 'assets/images/';

  String get colorPath => 'assets/skin/$currentSkin/color.json';

  String get svgPath => 'assets/svg/';

  Color skinColor(int index) {
    var colorMap = ColorLibrary.content[index];
    return colorMap?[currentSkin] ?? Colors.red;
  }
}






