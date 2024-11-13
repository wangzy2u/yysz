import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../logic.dart';

class PosterDialog extends StatefulWidget {
  const PosterDialog({super.key});

  @override
  _PosterDialogState createState() => _PosterDialogState();
}

class _PosterDialogState extends State<PosterDialog> {
  GlobalKey paintKey = new GlobalKey();
  final RecommendFriendsLogic logic = Get.put(RecommendFriendsLogic());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back(result: '');
            },
            child: Container(
                padding: EdgeInsets.only(right: 15.w, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '关闭',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                )),
          ),
          // Image.asset(
          //   'head_defalut.png'.imagePath,
          //   // width: 64.w,
          //   // height: 164.w,
          //   fit: BoxFit.cover,
          // ),
          RepaintBoundary(
            key: paintKey, //需要注意，此处绑定创建好的GlobalKey对象
            child: Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              height: 460.w,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 32.w, left: 16.w),
                    child: Text(
                      '链接数字与现实共享艺术与\n财富',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.w, left: 16.w),
                    child: Text(
                      '扫描下方二维码获取数字资产空投',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.w, left: 16.w),
                    child: Text(
                      '推荐码：${logic.inviteCode}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: 0.skColor),
                    ),
                  ),
                  SizedBox(
                    height: 26.w,
                  ),
                  Center(
                      child: Image.asset(
                    'efo_icon.png'.imagePath,
                    width: 334.w,
                    height: 167.w,
                    fit: BoxFit.cover,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16.w, top: 50.w),
                        child: Image.asset(
                          'yuanyushuzi.png'.imagePath,
                          width: 138.w,
                          height: 38.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 16.w, top: 20.w),
                        child: QrImageView(
                          data: logic.inviteLink,
                          size: 86,
                        ),
                        // Image.asset(
                        //   'erweima.png'.imagePath,
                        //   width: 64.w,
                        //   height: 64.w,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Container(
            height: 106.w,
            width: double.infinity,
            color: Colors.white,
            // decoration: const BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.all(Radius.circular(16))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      capturePng(paintKey, 10.0);
                      Get.back(result: '');
                      // if (res){
                      //   ToastUtil.showToast('保存成功！');
                      // } else {
                      //   ToastUtil.showToast('保存失败！');
                      // }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: 0.skColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const Center(
                        child: Text(
                          '保存海报到相册',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.transparent,
//     body: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () {
//             Get.back(result: '');
//           },
//           child: Container(
//               padding: EdgeInsets.only(right: 15.w, top: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'X',
//                     style: TextStyle(fontSize: 25.sp, color: Colors.white),
//                   ),
//                 ],
//               )),
//         ),
//         Image.asset(
//           'head_defalut.png'.imagePath,
//           // width: 64.w,
//           // height: 164.w,
//           fit: BoxFit.cover,
//         ),
//         Container(
//           height: 240.h,
//           width: double.infinity,
//           color: Colors.white,
//           // decoration: const BoxDecoration(
//           //     color: Colors.red,
//           //     borderRadius: BorderRadius.all(Radius.circular(16))),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 15.w, top: 20.w),
//                   child: Text(
//                     '分享至',
//                     style: TextStyle(
//                         color: 1.skColor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.w,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Image.asset(
//                           'head_defalut.png'.imagePath,
//                           width: 36.w,
//                           height: 36.w,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(
//                           height: 6.w,
//                         ),
//                         Text('微信好友'),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Image.asset(
//                           'head_defalut.png'.imagePath,
//                           width: 36.w,
//                           height: 36.w,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(
//                           height: 6.w,
//                         ),
//                         Text('QQ'),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Image.asset(
//                           'head_defalut.png'.imagePath,
//                           width: 36.w,
//                           height: 36.w,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(
//                           height: 6.w,
//                         ),
//                         Text('复制链接'),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Image.asset(
//                           'head_defalut.png'.imagePath,
//                           width: 36.w,
//                           height: 36.w,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(
//                           height: 6.w,
//                         ),
//                         Text('下载'),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.w,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back(result: '');
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(left: 15.w, right: 15.w),
//                     height: 40.w,
//                     decoration: BoxDecoration(
//                         color: 0.skColor,
//                         borderRadius: BorderRadius.all(Radius.circular(50))),
//                     child: const Center(
//                       child: Text(
//                         '取消',
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }

  /// 获取截取图片的数据
//compressionRatio：截图的图片质量，默认值是：1.0
  Future<String?> capturePng(
      GlobalKey paintKey, double compressionRatio) async {
    try {
      RenderRepaintBoundary? boundary =
          paintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      var image = await boundary?.toImage(pixelRatio: compressionRatio);
      ByteData? byteData = await image?.toByteData(format: ImageByteFormat.png);
      //getApplicationSupportDirectory需要引用path_provider库
      final directory = await getApplicationSupportDirectory();
      //这里需要导入import 'dart:io';很多人第一次导包会默认导入import 'dart:html';导致报错
      var imgFile = await File(
              '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png')
          .create();
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      //把Widget当前帧数据写入File文件中
      await imgFile.writeAsBytes(pngBytes!);

      saveImageToGallery(imgFile.path);
      return imgFile.path;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> saveImageToGallery(String imagePath) async {
    // 读取图片文件
    File file = File(imagePath);
    if (!await file.exists()) {
      // throw FileNotFoundError("File not found at path: $imagePath");
    }
    // 读取文件内容为 Uint8List
    Uint8List imageData = await file.readAsBytes();
    // 保存图片到相册
    final result = await ImageGallerySaver.saveImage(imageData);
    if (result) {
      print("Image saved to gallery successfully.");
    } else {
      print("Failed to save image to gallery.");
    }
  }

}
