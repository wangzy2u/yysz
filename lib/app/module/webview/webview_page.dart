import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../common/index.dart';
import '../../../common/widgets/appbar_x.dart';
import '../../data/base_api.dart';
import '../../network/network_manager.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final GlobalKey webViewKey = GlobalKey();

  String url = '';
  String html = '';
  String title = '';
  bool isShowBar = true;

  // List<String> hostList = [];
  // List<String> redirectList = [];

  UnmodifiableListView<UserScript>? initialUserScripts;

  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      javaScriptEnabled: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: false,
      mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  InAppWebViewSettings settings = InAppWebViewSettings(
    javaScriptEnabled: true,
      transparentBackground: true,
      useShouldOverrideUrlLoading: true,
      isInspectable: kReleaseVersion,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  @override
  void initState() {
    super.initState();
    var data = Get.parameters;

    url = data['url'] ?? '';
    html = data['html'] ?? '';
    title = data['title'] ?? '';
    isShowBar = (data['isShowBar'] ?? '1') == '1';

    // hostList.add(BaseApi.kHostTest);
    // hostList.add(BaseApi.kHostDev);
    // hostList.add(BaseApi.kHostDis);
    //
    // redirectList.add('/pmt/');
    // redirectList.add('/project/detail/');
    // redirectList.add('/wallet/index');

    String token = NetworkManager().token;
    if (token.isNotEmpty) {
      String scriptContent = "document.cookie = '${NetworkManager().token};path=/;'";
      UserScript script = UserScript(
        source: scriptContent,
        injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
        iosForMainFrameOnly: false,
      );
      initialUserScripts = UnmodifiableListView<UserScript>([script]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      body: SafeArea(
        child: Column(
          children: [
            if (isShowBar)
              buildAppbar(
                title: title,
                bgColor: 2.skColor,
                onTab: () {
                  webViewController?.canGoBack().then((value) {
                    if (value) {
                      webViewController?.goBack();
                    } else {
                      Get.back();
                    }
                  });
                },
              ),
            Expanded(
              child: InAppWebView(
                key: webViewKey,
                // contextMenu: contextMenu,
                initialData: html.isEmpty ? null : InAppWebViewInitialData(data: html),
                initialUrlRequest: url.isEmpty ? null : URLRequest(url: WebUri(url)),
                // initialFile: "assets/index.html",
                initialUserScripts: initialUserScripts,
                initialSettings: settings,
                // pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) async {
                  webViewController = controller;

                  webViewController?.addJavaScriptHandler(
                    handlerName: "navigateBack",
                    callback: (args) {
                      Get.back();
                    },
                  );
                  // webViewController?.addJavaScriptHandler(
                  //   handlerName: "navigateToLogin",
                  //   callback: (args) {
                  //     UserInfoManager().logout();
                  //     Get.toNamed(Routes.login);
                  //   },
                  // );
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                    // urlController.text = this.url;
                  });
                },
                androidOnPermissionRequest: (controller, origin, resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;



                  LoggerUtil.e('shouldOverrideUrlLoading:${uri.path}');

                  if(uri.path.contains('pay/result')){

                    Get.back();
                  }

                  // for (var host in hostList) {
                  //   if (uri.host == host) {
                  //     if (uri.path.isEmpty) {
                  //       Get.back(result: 'complete');
                  //       return NavigationActionPolicy.CANCEL;
                  //     }
                  //
                  //     for (var redirect in redirectList) {
                  //       if (uri.path.startsWith(redirect)) {
                  //         Get.back(result: 'complete');
                  //         return NavigationActionPolicy.CANCEL;
                  //       }
                  //     }
                  //     break;
                  //   }
                  // }

                  if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
                    if (await canLaunchUrlString(url)) {
                      // Launch the App
                      await launchUrlString(url);
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }
                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {},
                onLoadError: (controller, url, code, message) {},
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    // pullToRefreshController.endRefreshing();
                  }
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {},
                onConsoleMessage: (controller, consoleMessage) {
                  LoggerUtil.e(consoleMessage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
