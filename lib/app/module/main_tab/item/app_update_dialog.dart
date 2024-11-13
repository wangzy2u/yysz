import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/permission_util.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';
import 'package:nft_flutter/common/widgets/progress_bar/flutter_animation_progress_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/http/http/dio_new.dart';
import '../../../../common/index.dart';
import '../bean/app_update_bean.dart';

class AppUpdateDialog extends StatefulWidget {
  const AppUpdateDialog({super.key, required this.appUpdateBean});

  final AppUpdateBean appUpdateBean;

  @override
  State<AppUpdateDialog> createState() => _AppUpdateDialogState();
}

class _AppUpdateDialogState extends State<AppUpdateDialog> {
  String downUrl =
      'https://raw.githubusercontent.com/wangzy2u/debug-apk-download/refs/heads/main/Cassava_debug.apk';

  double index = 0;

  @override
  void initState() {
    super.initState();
  }

  // 下载并安装APK
  Future<void> _downloadAndInstallAPK(BuildContext context) async {
    //请求存储权限
    bool ok =
        await PermissionUtil.checkPermission(Permission.manageExternalStorage);
    //请求安装权限
    bool install =
        await PermissionUtil.checkPermission(Permission.requestInstallPackages);
    // 检查并请求存储权限
    if (ok && install) {
      try {
        final dir = await getExternalStorageDirectory();
        final filePath = '${dir?.path}/new_version.apk';

        final dio = Dio();
        await dio.download(
          widget.appUpdateBean.appUrl ?? '',
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              index = received / total * 100;
              print(
                  "Download progress: ${(received / total * 100).toStringAsFixed(0)}%");

              setState(() {});
            }
          },
        );
        print("文件地址: $filePath");
        // 下载完成后安装APK
        final res = await InstallPlugin.install(filePath);

        if (res['isSuccess']) {
          SystemNavigator.pop();
        }else{
          SystemNavigator.pop();
        }

        print("下载或安装失败: $res");
      } catch (e) {
        print("下载或安装失败: $e");
      }
    } else {
      print("存储权限被拒绝");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300.w,
          child: Column(
            children: [
              ImageX.asset(
                'icon_app_update.png'.skImagePath,
                width: 126.w,
                height: 126.w,
              ),
              if (index == 0) buildContent() else buildDownload(),
              SizedBox(
                height: 20.w,
              ),
            ],
          ),
        ).backgroundImage(DecorationImage(
          image: AssetImage('bg_app_update.png'.skImagePath),
          fit: BoxFit.fill,
        ))
      ],
    );
  }

  buildDownload() {
    return Column(
      children: [
        SizedBox(
          height: 16.w,
        ),
        Text(
          '新版本下载中',
          style: TextStyle(
              fontSize: 18.sp, fontWeight: FontWeight.w500, color: 1.skColor),
        ),
        SizedBox(
          height: 32.w,
        ),
        FAProgressBar(
          size: 8.w,
          progressColor: 0.skColor,
          backgroundColor: 22.skColor,
          currentValue: index,
          borderRadius: BorderRadius.circular(4.w),
          displayTextStyle: TextStyle(
              color: 9.skColor, fontSize: 10.sp, fontWeight: FontWeight.w400),
          displayText: '%',
        ).margin(horizontal: 20.w),
        SizedBox(
          height: 32.w,
        ),
        Text(
          '新版本努力下载中，请稍后',
          style: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w400, color: 9.skColor),
        ),
        SizedBox(
          height: 22.w,
        ),
      ],
    );
  }

  buildContent() {
    return Column(
      children: [
        SizedBox(
          height: 16.w,
        ),
        Text(
          '发现新版本',
          style: TextStyle(
              fontSize: 18.sp, fontWeight: FontWeight.w500, color: 1.skColor),
        ),
        SizedBox(
          height: 2.w,
        ),
        Text(
          widget.appUpdateBean.version ?? '',
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w400, color: 9.skColor),
        ),
        SizedBox(
          height: 20.w,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            '更新内容：',
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w500, color: 1.skColor),
          ),
        ),
        SizedBox(
          height: 8.w,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            widget.appUpdateBean.updateRemark ?? '',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w400, color: 9.skColor),
          ),
        ),
        SizedBox(
          height: 32.w,
        ),
        Row(
          children: [
            if(widget.appUpdateBean.updateType != '0')
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 44.w,
                color: 5.skColor,
                child: Text(
                  '暂不',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: 9.skColor),
                ).center(),
              ).clipRRect(all: 22.w).margin(horizontal: 6.w),
            ).expand(flex: 1),
            InkWell(
              onTap: () {
                if (Platform.isAndroid) {
                  _downloadAndInstallAPK(context);
                } else {
                  ToastUtil.showToast('跳转iOS下载链接');
                }
              },
              child: Container(
                height: 44.w,
                color: 0.skColor,
                child: Text(
                  '立即更新',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: 2.skColor),
                ).center(),
              ).clipRRect(all: 22.w).margin(horizontal: 6.w),
            ).expand(flex: 1),
          ],
        ).padding(horizontal: 12.w),
      ],
    );
  }
}
