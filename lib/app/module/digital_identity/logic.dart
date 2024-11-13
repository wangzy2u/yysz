import 'package:get/get.dart';
import 'package:nft_flutter/app/module/announcement_center/announcement_detail/logic.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/public_api.dart';
import 'package:nft_flutter/app/network/network_manager.dart';

import '../../../common/http/http/src/http_exceptions.dart';
import '../user/bean/user_info_bean.dart';
import 'bean/member_card_list_bean.dart';

class DigitalIdentityLogic extends GetxController {
  UserInfoBean? userInfoBean;


  int tabIndex = 0;


  MemberCardListBean? residentCardListBean;
  MemberCardListBean? groupCardListBean;

  @override
  void onReady() {
    super.onReady();


    checkUserInfo();


    getMemberCard(1);
    getMemberCard(2);

  }



  void checkUserInfo() async {
    userInfoBean = UserInfoManager().userInfoBean;

    userInfoBean ??= await UserInfoManager().updateUserInfo();
    update();

  }


  void getMemberCard(int type) async {

    try {
      var res = await NetworkManager().findMemberCard(type);

      if(res.success){

        if(type == 1){
          residentCardListBean = MemberCardListBean.fromJson(res.data);
        }else if(type == 2){
          groupCardListBean = MemberCardListBean.fromJson(res.data);
        }
      }

    } on DMRequestException catch (e) {
      // ToastUtil.showToast(e.msg);
    }
    update();

  }





}
