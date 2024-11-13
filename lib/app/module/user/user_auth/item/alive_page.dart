


import 'package:alive_flutter_plugin/alive_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
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
            _result = data["token"];
            bool isPassed = data["isPassed"];
            if (isPassed) {
              print("token: " + _result + "isPassed: $isPassed");
            } else {
              print("isPassed: $isPassed");
            }
            _currentStep = 0;
            stopLive();
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('易盾活体检测'),
            ),
            body: new SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: new Center(
                child: _buildContent(context),
              ),
            ),
          ),
        ),
        canPop: true,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            // Android放在这里提前处理，否则有残影
            if (defaultTargetPlatform == TargetPlatform.android) {
              aliveFlutterPlugin.stopLiveDetect();
              //android需要释放资源，否则会引发内存泄露
              aliveFlutterPlugin.destroy();
            }
          }
        });
  }

  @override
  void dispose() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      aliveFlutterPlugin.stopLiveDetect();
    }
    super.dispose();
  }

  void init() {
    aliveFlutterPlugin.init("2b2f1ab651fe40ef9cf5290b2fdbef7d", 40, true);
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

  Widget _buildContent(BuildContext context) {
    return Center(
      widthFactor: 2,
      child: new Column(
        children: [
          showDetailText(),
          showFaceImageWidget(),
          showAnimatedGif(),
          startDetectButton(),
          stopDetectButton(),
          backButton(context),
        ],
      ),
    );
  }

  Widget showDetailText() {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        color: Colors.white,
        child: Text(_result, textAlign: TextAlign.center),
        width: 300,
        height: 40,
      ),
    );
  }

  Widget showFaceImageWidget() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return new Center(
        child: Stack(
          children: [
            Container(
                width: 300,
                height: 400,
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
                      creationParams: {"width": 300, "height": 400},
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
                alignment: Alignment.center),
            // 活体检测SurfaceView会透到下一层处理
            Visibility(
                visible: mastVisible,
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
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

  Widget startDetectButton() {
    return new Container(
      child: SizedBox(
        child: new CustomButton(
          onPressed: () {
            startLive();
          },
          title: "开始检测",
        ),
        width: double.infinity,
        height: 49,
      ),
      margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
    );
  }

  Widget stopDetectButton() {
    return new Container(
      child: SizedBox(
        child: new CustomButton(
          onPressed: () {
            stopLive();
          },
          title: "停止检测",
        ),
        width: double.infinity,
        height: 49,
      ),
      margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
    );
  }

  Widget backButton(BuildContext context) {
    return new Container(
      child: SizedBox(
        child: new CustomButton(
          onPressed: () {
            // Android放在这里提前处理，否则有残影
            if (defaultTargetPlatform == TargetPlatform.android) {
              aliveFlutterPlugin.stopLiveDetect();
              //android需要释放资源，否则会引发内存泄露
              aliveFlutterPlugin.destroy();
            }
            Navigator.pop(context);
          },
          title: "返回",
        ),
        width: double.infinity,
        height: 49,
      ),
      margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
    );
  }

  Widget showAnimatedGif() {
    /**
     * _currentStep == 1 右转
     * _currentStep == 2 左转
     * _currentStep == 3 张嘴
     * _currentStep == 4 眨眼
     */
    var image = '';
    if (_currentStep == 1) {
      image = 'assets/images/turn-right.gif';
    } else if (_currentStep == 2) {
      image = 'assets/images/turn-left.gif';
    } else if (_currentStep == 3) {
      image = 'assets/images/open-mouth.gif';
    } else if (_currentStep == 4) {
      image = 'assets/images/open-eyes.gif';
    } else {
      image = 'assets/images/pic_front.png';
    }
    return new Container(
      child: Container(
        width: 120,
        height: 120,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}

/// 封装 按钮
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButton({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return new ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
          WidgetStateProperty.resolveWith((states) => Colors.blue)),
      child: new Text(
        "$title",
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }
}
