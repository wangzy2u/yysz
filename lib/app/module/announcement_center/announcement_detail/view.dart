import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';

import '../../webview/webview_widget.dart';
import 'logic.dart';

class AnnouncementDetailPage extends StatelessWidget {
  AnnouncementDetailPage({Key? key}) : super(key: key);

  final AnnouncementDetailLogic logic = Get.put(AnnouncementDetailLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      appBar: buildAppbar(title: '公告详情'),

      body: Padding(padding: EdgeInsets.all(15.w),

        child: GetBuilder<AnnouncementDetailLogic>(builder: (logic) {
          return WebViewWidget(
            htmlContent: logic.announcementDetailBean?.content ?? '',);
        }),
      ),
    );
  }
}
