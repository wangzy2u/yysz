import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/account.dart';
import '../../../network/network_manager.dart';
import '../../announcement_center/bean/Tag_bean.dart';
import 'withdrawal_details_bean.dart';

class RecommendFriendsLogic extends GetxController {

  late List inviteFriendsList = [];
  List<TagBean> tagList = [];
  String inviteCode = '';
  String inviteLink = '';
  List<WithdrawalDetailsItemBean> recordList = [];

  @override
  void onReady() {

    getInviteList();
    getInviteRules();
    getInviteInfo();
    super.onReady();
  }

  // 邀请人列表
  void getInviteList() async{
    var res  = await NetworkManager().getInviteFriendsList();
    inviteFriendsList = res.data;
    update();
  }

  void getQueryRedPageList() async{
    recordList = await NetworkManager().getQueryRedPageList();
    update();
  }

  //获取邀请规则
  getInviteRules() async {
    var res = await NetworkManager().get('/dictconfig/findDictItemInCache',
        queryParameters: {'dictTypeCode': 'inviteRule'});
    if (res.success) {
      if (res.data != null) {
        List<TagBean> _content = [];
        res.data.forEach((v) {
          _content.add(TagBean.fromJson(v));
        });
        tagList = _content;
      }
    }
    update();
    // update(['PlatformView']);
    // getPlatformList(tagList.first.dictItemCode??'1',1);
  }

  //获取邀请码
  getInviteInfo() async {
    var res = await NetworkManager().get('/member/getInviteInfo',
        queryParameters: {});
    if (res.success) {
      inviteCode = res.data['inviteCode'];
      inviteLink = res.data['inviteLink'];
    }
    update();
  }

}
