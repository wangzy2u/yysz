import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../common/utils/toast_util.dart';
import '../../../../common/widgets/appbar_x.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../routes/app_routes.dart';
import '../../main_tab/logic.dart';
import 'logic.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key? key}) : super(key: key);

  final User_profileLogic logic = Get.put(User_profileLogic());
  late MainTabLogic mainTabLogic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      appBar: buildAppbar(title: '个人信息', bgColor: 4.skColor),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView(
                  children: [
                    Container(
                      // height: UserInfoManager().isLogin ? 258.h : 212.h,
                      height: 270.w,
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
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '头像',
                                    style: TextStyle(fontSize: 14.sp, color: 1.skColor),
                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
                                      GetBuilder<UserInfoManager>(
                                        id: "MineUserInfo",
                                        builder: (userInfoManager) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular((32 / 2).w)),
                                            child: SizedBox(
                                              width: 32.w,
                                              height: 32.h,
                                              child: Image.network(
                                                '${userInfoManager.userInfoBean?.avatar ?? ''}',
                                                fit: BoxFit.cover,
                                                errorBuilder: (buildContext, object,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'head_defalut.png'.imagePath,
                                                    width: 32.w,
                                                    height: 32.w,
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              ),
                                            ),
                                          );;
                                        },
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
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
                            onTap: () {
                              selectImage(context);
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 16, right: 20),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '昵称',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                GetBuilder<UserInfoManager>(
                                  id: "MineUserInfo",
                                  builder: (userInfoManager) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 20, top: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${UserInfoManager().userInfoBean?.nickName}',
                                            style: TextStyle(
                                                color: 3.skColor,
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Image.asset(
                                            'right_arrow.png'.imagePath,
                                            fit: BoxFit.cover,
                                            // width: 16.w,
                                            height: 10.w,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.changeNickname,
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 16, right: 20),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '手机号',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)
                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${UserInfoManager().userInfoBean?.mobile}',
                                        style: TextStyle(
                                            color: 3.skColor, fontSize: 14.sp),
                                      ),
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
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '实名认证',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        UserInfoManager()
                                                    .userInfoBean
                                                    ?.authStatus ==
                                                0
                                            ? '未认证'
                                            : '已认证',
                                        style: TextStyle(
                                            color: 3.skColor, fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
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
                            onTap: () {
                              Get.toNamed(AppRoutes.userAuth);
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 16, right: 20),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '地区信息',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Text(
                                    '${UserInfoManager().userInfoBean?.address ?? ''}',
                                    style: TextStyle(
                                        color: 3.skColor, fontSize: 14.sp),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Container(
                      height: 52.w,
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
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '推荐人',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${UserInfoManager().userInfoBean?.inviterName ?? ''}',
                                        style: TextStyle(
                                            color: 3.skColor, fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
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
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.recommenderPage,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Container(
                      height: 154.w,
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
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '区块链地址',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                // (UserInfoManager().userInfoBean?.blockChainAddr ?? '').length == 0 ? Container() :
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: blockChainAddrTextWidet(
                                      UserInfoManager()),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 16, right: 20),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '最近登录时间',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${UserInfoManager().userInfoBean?.latelyLoginTime}',
                                        style: TextStyle(
                                            color: 3.skColor, fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
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
                            onTap: () {
                              // Get.toNamed(
                              //   AppRoutes.webView,
                              //   parameters: {
                              //     'url': BaseApi.userAgreementUrl,
                              //     'title': '用户协议',
                              //     'isShowBar': '1',
                              //   },
                              // );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 16, right: 20),
                            height: 1.w,
                            color: 10.skColor,
                          ),
                          GestureDetector(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 16),
                                  child: Text(
                                    '操作密码',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                                Expanded(child: Text('')),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 16),
                                  child: Row(
                                    children: [
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
                            onTap: () {
                              // 跳转操作密码
                              Get.toNamed(
                                AppRoutes.operationPwd,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 44.w,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 12.w),
                                  child: Text(
                                    '退出登录',
                                      style: TextStyle(fontSize: 14.sp, color: 1.skColor)                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              UserInfoManager().logout();
                              final UserInfoManager userInfoManager =
                                  Get.find();
                              userInfoManager.update(['MineUserInfo']);
                              Get.back();
                              Get.toNamed(AppRoutes.login);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Future<File?> selectImage(BuildContext context) async {
    _showDialog(context);
  }

  showImagePicker(int typeIndex) async {
    if (typeIndex == 0) {
      //调用手机相机
      final ImagePicker picker = new ImagePicker();
      var pickerFile = await picker.getImage(source: ImageSource.camera);
      if (pickerFile != null) {
        File imageFile = File(pickerFile.path);
        if (kDebugMode) {
          print('路径-》：$imageFile');
        }
        File? res = await compressImage(imageFile);
        logic.uploadFile(res ?? imageFile);
      }
      return;
    }
    // 嗲用相册
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      File imageFile = File(pickerFile.path);
      if (kDebugMode) {
        print('路径-》：$imageFile');
      }
      File? res = await compressImage(imageFile);
      logic.uploadFile(res ?? imageFile);
    }
  }

  Future<File?> compressImage(File file) async {
    if (file.lengthSync() < 1 * 1024 * 1024) {
      return file;
    }
    Directory cache = await getTemporaryDirectory();
    int time = DateTime.now().millisecondsSinceEpoch;
    String savePath = "${cache.path}/AllenSu_$time.jpg";
    var result = await FlutterImageCompress.compressAndGetFile(
        file.path, format: CompressFormat.jpeg, savePath, quality: 80);

    if (result != null) {
      if (kDebugMode) {
        // print("压缩后图片大小：${getSize(result.readAsBytesSync().length)}");
      }
    }
    return result;
  }

  String obfuscateString(String input) {
    if (input.length <= 11) {
      // 如果字符串长度小于等于11，则不需要截断，直接返回
      return input;
    } else {
      // 截取前5个字符和后5个字符，并在中间插入六个点
      return input.substring(0, 5) +
          '******' +
          input.substring(input.length - 5);
    }
  }

  Widget blockChainAddrTextWidet(UserInfoManager userInfoManager) {
    String chainAddrStr = userInfoManager.userInfoBean?.blockChainAddr ?? '';
    return (chainAddrStr.isEmptyOrNull)
        ? Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '实名认证后生成',
            style: TextStyle(color: 3.skColor))
        : Row(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                '${obfuscateString(chainAddrStr)}',
                style: TextStyle(color: 3.skColor),
              ),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: chainAddrStr));
                    ToastUtil.showToast('复制成功');
                  },
                  child: ImageX(
                    type: ImageType.asset,
                    image: 'copy_icon.png'.imagePath,
                    height: 12.w,
                    width: 12.h,
                  )),
            ],
          );
  }

  void _showDialog(BuildContext cxt) {
    showCupertinoModalPopup<int>(
        context: cxt,
        builder: (cxt) {
          var dialog = CupertinoActionSheet(
            title: Text("请选择"),
//        message: Text('上传头像!'),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 0);
                },
                child: Text(
                  "取消",
                  style: TextStyle(color: 0.skColor),
                )),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    showImagePicker(0);
                    Navigator.pop(cxt, 1);
                  },
                  child: Text('相机', style: TextStyle(color: Colors.black))),
              CupertinoActionSheetAction(
                  onPressed: () {
                    showImagePicker(1);
                    Navigator.pop(cxt, 2);
                  },
                  child: Text('相册', style: TextStyle(color: Colors.black))),
            ],
          );
          return dialog;
        });
  }
}
