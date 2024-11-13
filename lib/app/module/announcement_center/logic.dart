import 'package:get/get.dart';
import 'package:nft_flutter/app/module/announcement_center/bean/Tag_bean.dart';
import 'package:nft_flutter/app/network/network_manager.dart';

import 'bean/platform_list_bean.dart';

class AnnouncementCenterLogic extends GetxController {
  //平台- 标签
  List<TagBean> tagList = [];
  List<PlatformContent> platformList = [];

  final tagSelectIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();

    getTagList();
  }

  //选择标签
  void selectTag(int index) {
    tagSelectIndex.value = index;

    getPlatformList(tagList[index].dictItemCode??'1',1);
  }

  //获取平台公告标签
  getTagList() async {
    var res = await NetworkManager().get('/dictconfig/findDictItemInCache',
        queryParameters: {'dictTypeCode': 'noticeType'});
    if (res.success) {
      if (res.data != null) {
        List<TagBean> _content = [];
        res.data.forEach((v) {
          _content.add(TagBean.fromJson(v));
        });

        tagList = _content;
      }
    }

    update(['PlatformView']);

    getPlatformList(tagList.first.dictItemCode??'1',1);

  }

  //获取平台公告列表 -  http://175.27.138.121:8088/api/notice/findNoticeAbstractByPage?pageSize=10&pageNum=1&type=1

  getPlatformList(String type, int pageNum) async {
    bool isNoMores = true;

    var res = await NetworkManager().get('/notice/findNoticeAbstractByPage',
        queryParameters: {'pageNum': pageNum, 'type': type, 'pageSize': 10});
    if (res.success) {
      if (res.data != null) {
        PlatformListBean platformListBean = PlatformListBean.fromJson(res.data);
        if (pageNum == 1) {
          platformList.clear();
        }

        if (platformListBean != null) {
          platformList.addAll(platformListBean.content ?? []);

          if (platformList.length < (platformListBean.total ?? 0)) {
            isNoMores = false;
          } else {
            isNoMores = true;
          }
        }
      }
    }
    update(['PlatformView']);
    return isNoMores;
  }
}
