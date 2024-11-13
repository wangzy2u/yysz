import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nft_flutter/common/utils/log_util.dart';


class WebViewWidget extends StatelessWidget {
  final String htmlContent;

  WebViewWidget({Key? key, required this.htmlContent}) : super(key: key);
  final GlobalKey webViewKey = GlobalKey();

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
      ));

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      // contextMenu: contextMenu,
      initialData: htmlContent.isEmpty ? null : InAppWebViewInitialData(data: htmlContent),

      initialUrlRequest: null,
      // initialFile: "assets/index.html",
      initialUserScripts: UnmodifiableListView<UserScript>([]),
      initialOptions: options,
      // pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) {},
      onLoadStart: (controller, url) {},
      androidOnPermissionRequest: (controller, origin, resources) async {
        return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
      },

      shouldOverrideUrlLoading: (controller, navigationAction) async {
        var uri = navigationAction.request.url!;

        if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
          // if (await canLaunch(url)) {
          //   // Launch the App
          //   await launch(
          //     url,
          //   );
          //   // and cancel the request
          //   return NavigationActionPolicy.CANCEL;
          // }
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
    );
  }
}
