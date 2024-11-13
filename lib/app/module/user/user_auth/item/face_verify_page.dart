import 'package:alive_flutter_plugin/alive_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/data/common_const.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../../common/index.dart';
import '../../../../../common/utils/log_util.dart';

class FaceVerifyPage extends StatefulWidget {
  const FaceVerifyPage({super.key});

  @override
  State<FaceVerifyPage> createState() => _FaceVerifyPageState();
}

class _FaceVerifyPageState extends State<FaceVerifyPage> {
  final AliveFlutterPlugin aliveFlutterPlugin = new AliveFlutterPlugin();

  String _result = "请开始活体检测";
  int _currentStep = 0;
  String action = "";
  bool mastVisible = true;

  var eventChannel = const EventChannel("yd_alive_flutter_event_channel");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
    eventChannel.receiveBroadcastStream().listen(_onData, onError: _onError);
  }

  void init() {
    aliveFlutterPlugin.init(faceVerifyId, 40, true);
  }

  void _onData(response) {
    if (response is Map) {
      if (mounted) {
        setState(() {
          var method = response["method"];
          var data = response["data"];
          if (method == "onReady") {
            print("初始化引擎是否成功：" + data["initResult"].toString());
            this.setState(() {
              mastVisible = false;
            });
          } else if (method == "onChecking") {
            _currentStep = data["currentStep"];
            _result = data["message"];
          } else if (method == "onChecked") {
            _result = '检测完成';
            bool isPassed = data["isPassed"];
            if (isPassed) {
              // // Android放在这里提前处理，否则有残影
              // if (defaultTargetPlatform == TargetPlatform.android) {
              //   aliveFlutterPlugin.stopLiveDetect();
              //   //android需要释放资源，否则会引发内存泄露
              //   aliveFlutterPlugin.destroy();
              // }
              _currentStep = 0;
              stopLive();

              Get.back(result: data["token"]);
              print("token: " + _result + "isPassed: $isPassed");
            } else {
              _currentStep = 0;
              stopLive();
              print("isPassed: $isPassed");
            }
          } else if (method == "onError") {
            _result = data["message"];
          }
        });
      }
    }
  }

  _onError(dynamic error) {
    print('Received error: ${error.message}');
  }

  void startLive() {
    aliveFlutterPlugin.startLiveDetect().then((value) {
      /**
       * action表示返回的动作，动作状态表示：0——正面，1——右转，2——左转，3——张嘴，4——眨眼。
       */
      var method = value["method"];
      var data = value["data"];
      print("当前阶段为：" + method);
      print("下发的动作序列为：" + data["actions"]);
    });
  }

  void stopLive() {
    _currentStep = 0;
    aliveFlutterPlugin.stopLiveDetect();
  }

  @override
  void dispose() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      aliveFlutterPlugin.stopLiveDetect();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, value) async {
        print('是否返回了0000000-------$didPop--------$value');
        // Android放在这里提前处理，否则有残影
        if (defaultTargetPlatform == TargetPlatform.android) {
          aliveFlutterPlugin.stopLiveDetect();
          //android需要释放资源，否则会引发内存泄露
          aliveFlutterPlugin.destroy();
        }
        // Get.back();
      },
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: 2.skColor,
          appBar: buildAppbar(title: '人脸识别'),
          body: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 23.w,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    '为保障账户安全',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  '需采集您的人脸信息以核验身份',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: 3.skColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 32.w,
                ),
                showFaceImageWidget(),
                SizedBox(
                  height: 32.w,
                ),
                buildTipsImg(),
                Container(
                  height: 140.w,
                  alignment: Alignment.center,
                  child: Text(
                    _result,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: 3.skColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed(AppRoutes.alivePage);
                    startLive();
                  },
                  child: Container(
                    height: 44.w,
                    color: 0.skColor,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      '开始人脸检测',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: 2.skColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ).clipRRect(all: 8.w).marginSymmetric(horizontal: 15.w),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.w, left: 15.w, right: 15.w),
                  child: RichText(
                    text: TextSpan(
                      text: '使用即代表同意授权采集并使用人脸信息用于核验身份，查看',
                      style: TextStyle(
                        color: 3.skColor,
                        fontSize: 12.sp,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: '《人脸识别服务用户授权协议》',
                          style: TextStyle(color: 0.skColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.toNamed(
                              //   AppRoutes.webView,
                              //   parameters: {
                              //     'url': BaseApi.userAgreementUrl,
                              //     'title': '用户协议',
                              //     'isShowBar': '1',
                              //   },
                              // );

                              LoggerUtil.d('《用户协议》');
                              // Get.toNamed(Routes.webView, parameters: {
                              //   'url': BaseApi.userAgreementUrl.appUrl,
                              //   'title': '2m用户协议',
                              //   'isShowBar': '1',
                              // });
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTipsImg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ImageX.asset(
              'icon_avoid_occlusion.png'.imagePath,
              width: 44.w,
              height: 44.w,
            ),
            SizedBox(
              height: 6.w,
            ),
            Text(
              '避免遮挡',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: 1.skColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          width: 50.w,
        ),
        Column(
          children: [
            ImageX.asset(
              'icon_good_lighting.png'.imagePath,
              width: 44.w,
              height: 44.w,
            ),
            SizedBox(
              height: 6.w,
            ),
            Text(
              '光线充足',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: 1.skColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          width: 50.w,
        ),
        Column(
          children: [
            ImageX.asset(
              'icon_facing_phone.png'.imagePath,
              width: 44.w,
              height: 44.w,
            ),
            SizedBox(
              height: 6.w,
            ),
            Text(
              '正对手机',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: 1.skColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }

  Widget showFaceImageWidget() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return new Center(
        child: Stack(
          children: [
            Container(
              width: 200.w,
              height: 200.w,
              alignment: Alignment.center,
              child: PlatformViewLink(
                viewType: "platform-view-alive",
                surfaceFactory: (context, controller) {
                  return AndroidViewSurface(
                    controller: controller as AndroidViewController,
                    gestureRecognizers: const <Factory<
                        OneSequenceGestureRecognizer>>{},
                    hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                  );
                },
                onCreatePlatformView: (params) {
                  return PlatformViewsService.initExpensiveAndroidView(
                    id: params.id,
                    viewType: "platform-view-alive",
                    layoutDirection: TextDirection.ltr,
                    creationParams: {
                      "width": 200.w.toInt(),
                      "height": 200.w.toInt()
                    },
                    creationParamsCodec: const StandardMessageCodec(),
                    onFocus: () {
                      params.onFocusChanged(true);
                    },
                  )
                    ..addOnPlatformViewCreatedListener(
                        params.onPlatformViewCreated)
                    ..create();
                },
              ),
            ),
            // 活体检测SurfaceView会透到下一层处理
            Visibility(
                visible: mastVisible,
                child: Container(
                  width: 200.w,
                  height: 200.w,
                  child: ImageX.asset('icon_default_face_verify.png'.imagePath),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )),
          ],
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return new Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: UiKitView(
            viewType: 'com.flutter.alive.imageview',
            creationParams: {
              "width": "200",
              "height": "200",
              "radius": "100",
            },
            //参数的编码方式
            creationParamsCodec: const StandardMessageCodec(),
          ),
        ),
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }
}
