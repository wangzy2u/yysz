import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../../common/utils/toast_util.dart';
import '../../../../../common/widgets/appbar_x.dart';
import '../../../../data/base_api.dart';
import '../../../../routes/app_routes.dart';
import 'logic.dart';

class SetPage extends StatefulWidget {
  SetPage(
      {Key? key})
      : super(key: key);

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {

  final SetLogic logic = Get.put(SetLogic());

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

  void clearImageCache() {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
    ToastUtil.showToast('缓存清除成功!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      appBar: buildAppbar(title: '设置', bgColor: 4.skColor),
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 52.w,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: GestureDetector(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin:
                        EdgeInsets.only(left: 20.w, top: 16.w, bottom: 16.w),
                        child: Text(
                          '注销账户',
                            style: TextStyle(fontSize: 14.sp, color: 1.skColor)                        ),
                      ),
                      Expanded(child: Text('')),
                      Container(
                        margin:
                         EdgeInsets.only(right: 20.w, top: 16.w, bottom: 16.w),
                        child: Image.asset(
                          'right_arrow.png'.imagePath,
                          fit: BoxFit.cover,
                          // width: 16.w,
                          height: 10.w,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(AppRoutes.logOffAccountPage);
                  },
                ),
              ),
              SizedBox(
                height: 7.w,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      // height: UserInfoManager().isLogin ? 258.h : 212.h,
                      height: 230.w,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                       EdgeInsets.only(left: 20.w, top: 20.w),
                                  child: Text(
                                    '清除缓存',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                       EdgeInsets.only(right: 20.w, top: 16.w),
                                  child: Image.asset(
                                    'right_arrow.png'.imagePath,
                                    fit: BoxFit.cover,
                                    // width: 16.w,
                                    height: 10.w,
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              clearImageCache();
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w, top: 16.w, right: 20.w),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                       EdgeInsets.only(left: 20.w, top: 16.w),
                                  child: Text(
                                    '服务协议',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                    EdgeInsets.only(right: 20.w, top: 16.w),
                                  child: Image.asset(
                                    'right_arrow.png'.imagePath,
                                    fit: BoxFit.cover,
                                    // width: 16.w,
                                    height: 10.w,
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.webView,
                                parameters: {
                                  'url': BaseApi.userAgreementUrl,
                                  'title': '用户协议',
                                  'isShowBar': '1',
                                },
                              );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w, top: 16.w, right: 20.w),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                    EdgeInsets.only(left: 20.w, top: 16.w),
                                  child: Text(
                                    '版本更新',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                       EdgeInsets.only(right: 20.w, top: 16.w),
                                  child: Row(
                                    children: [
                                      Text('v${version}', style: TextStyle(fontSize: 14.sp, color: 3.skColor),),
                                      SizedBox(width: 10.w,),
                                      Image.asset(
                                        'right_arrow.png'.imagePath,
                                        fit: BoxFit.cover,
                                        // width: 16.w,
                                        height: 10.w,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w, top: 16.w, right: 20.w),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 60.w,
                              // color: Colors.red,
                              child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 20.w, top: 0.w),
                                  child: Text(
                                    '关于我们',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                   EdgeInsets.only(right: 20.w, top: 0.w),
                                  child: Image.asset(
                                    'right_arrow.png'.imagePath,
                                    fit: BoxFit.cover,
                                    // width: 16.w,
                                    height: 10.w,
                                  ),
                                )
                              ],
                            ),),
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.aboutPage,
                              );
                            },
                          ),
                          // UserInfoManager().isLogin ? Container(
                          //   margin: const EdgeInsets.only(
                          //       left: 20, top: 16, right: 20),
                          //   height: 1,
                          //   color: 10.skColor,
                          // ) : Container(),
                          // UserInfoManager().isLogin ?
                          // GestureDetector(
                          //   child: Row(
                          //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       Container(
                          //         margin:
                          //         const EdgeInsets.only(left: 20, top: 16),
                          //         child: const Text(
                          //           '退出登录',
                          //           style: TextStyle(),
                          //         ),
                          //       ),
                          //       Expanded(child: Text('')),
                          //       Container(
                          //         margin:
                          //         const EdgeInsets.only(right: 20, top: 16),
                          //         child: Image.asset(
                          //           'right_arrow.png'.imagePath,
                          //           fit: BoxFit.cover,
                          //           width: 16.w,
                          //           height: 10.h,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          //   onTap: () {
                          //     UserInfoManager().logout();
                          //     Get.toNamed(
                          //       AppRoutes.login,
                          //     );
                          //   },
                          // ) : Container()
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
