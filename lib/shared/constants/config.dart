import 'package:flutter/material.dart';
import 'package:schedule/shared/models/app_color.dart';

class AppConfig {
  static const double appBarHeight = 80;

  static const borderRadius50 = BorderRadius.all(Radius.circular(50));
  static const borderRadius16 = BorderRadius.all(Radius.circular(16));
  static const borderRadius12 = BorderRadius.all(Radius.circular(12));
  static const borderRadius8 = BorderRadius.all(Radius.circular(8));

  static const double s2 = 2;
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;

  static const divider = Divider(color: Color(0xFF292929), height: 1);
}

class AppColors {
  static const double shadowSpreadRange = 5;
  static const double shadowBlurRange = 10;

  static const fgLight = AppColor("fg_light", Color(0xFFF2F2F2));
  static const fgMid = AppColor("fg_middle", Color(0xFF828282));
  static const fgDark = AppColor("fg_dark", Color(0xFF292929));
  static const bgLight = AppColor("bg_light", Color(0xFF1F1F1F));
  static const bgMid = AppColor("bg_middle", Color(0xFF191919));
  static const bgDark = AppColor("bg_dark", Color(0xFF141414));

  static const greenTea = AppColor("green_tea", Color(0xFFC6BF16), Color(0x18C6BF16), Color(0x4B91C616));
  static const lime = AppColor("lime", Color(0xFF78C616), Color(0x1878C616), Color(0x4B3FC616));
  static const green = AppColor("green", Color(0xFF2EB75D), Color(0x182EB75D), Color(0x4B2EB730));
  static const turquoise = AppColor("turquoise", Color(0xFF3ED7C4), Color(0x183ED7C4), Color(0x4B3EB6D7));
  static const azure = AppColor("azure", Color(0xFF219FFA), Color(0x18219FFA), Color(0x4B2157FA));
  static const lapis = AppColor("lapis", Color(0xFF3E22EE), Color(0x183E22EE), Color(0x4B224BEE));
  static const amethyst = AppColor("amethyst", Color(0xFF8F00FF), Color(0x188F00FF), Color(0x4B3C00FF));
  static const purple = AppColor("purple", Color(0xFFCC00FF), Color(0x18CC00FF), Color(0x4BFF00DD));
  static const hotPink = AppColor("hot_pink", Color(0xFFFF008A), Color(0x18FF008A), Color(0x4BFF0033));
  static const crimsone = AppColor("crimsone", Color(0xFFFF004D), Color(0x18FF004D), Color(0x4BFF0000));
  static const roseRed = AppColor("rose_red", Color(0xFFFF0000), Color(0x18FF0000), Color(0x4BFF5500));
  static const flameOrange = AppColor("flame_orange", Color(0xFFFF5C00), Color(0x18FF5C00), Color(0x4BFF0900));
  static const merigold = AppColor("merigold", Color(0xFFFFA800), Color(0x18FFA800), Color(0x4BFF5500));
  static const bumblebee = AppColor("bumblebee", Color(0xFFFFE600), Color(0x18FFE600), Color(0x4BFFBB00));
  
  static AppColor getAppColorByName(String name) {
    switch (name) {
      case "fg_light": return fgLight;
      case "fg_middle": return fgMid;
      case "fg_dark": return fgDark;
      case "bg_light": return bgLight;
      case "bg_middle": return bgMid;
      case "bg_dark": return bgDark;
      case "green_tea": return greenTea;
      case "lime": return lime;
      case "green": return green;
      case "turquoise": return turquoise;
      case "azure": return azure;
      case "lapis": return lapis;
      case "amethyst": return amethyst;
      case "purple": return purple;
      case "hot_pink": return hotPink;
      case "crimsone": return crimsone;
      case "rose_red": return roseRed;
      case "flame_orange": return flameOrange;
      case "merigold": return merigold;
    }
    return fgLight;
  }
}