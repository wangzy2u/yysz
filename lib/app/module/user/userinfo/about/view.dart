import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../../common/widgets/appbar_x.dart';
import 'logic.dart';

class AboutPage extends StatefulWidget {
  AboutPage(
      {Key? key})
      : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}
class _AboutPageState extends State<AboutPage> {

  final AboutLogic logic = Get.put(AboutLogic());

  late String packageName;
  String version = "";
  String phoneNumber = '';

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        packageName = packageInfo.packageName;
        version = packageInfo.version;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: '关于我们'),
      body: Column(
        children: [
          SizedBox(
            height: 32.w,
          ),
          Center(
            child: Container(
              height: 80.w,
              width: 80.w,
              child: Image.asset('about_icon.png'.imagePath, fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          Container(
            height: 18.w,
            width: 99.w,
            child: Image.asset('about_yuanyushuzi.png'.imagePath,
                fit: BoxFit.fill),
          ),
          SizedBox(
            height: 4.w,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'v ${version}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Expanded(
            child: Text(""),
          ),
          Text('ICP备案号：京*********'),
          Text('Copyright © 2024 Yuanyushuzi.All Rights Reserved.'),
          SizedBox(
            height: 54.w,
          ),
        ],
      ).marginSymmetric(horizontal: 15.w),
    );
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version; // 版本号
    String buildNumber = packageInfo.buildNumber; // 构建号
    return versionName;
    // print('Version Name: $versionName');
    // print('Build Number: $buildNumber');
  }
}
