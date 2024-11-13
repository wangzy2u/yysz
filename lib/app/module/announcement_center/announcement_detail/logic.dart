import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/brand_api.dart';
import 'package:nft_flutter/app/network/api/public_api.dart';

import '../../../network/network_manager.dart';
import '../bean/announcement_detail_bean.dart';

class AnnouncementDetailLogic extends GetxController {


  AnnouncementDetailBean? announcementDetailBean;
  String? id;
  @override
  void onReady() {
    super.onReady();

    id = Get.arguments['id'];




    getDetail();
  }



  void getDetail() async {
    var res =  await NetworkManager().getAnnouncementDetail(id ?? '');

    if(res.success && res.data != null){
      announcementDetailBean = AnnouncementDetailBean.fromJson(res.data);


    }


    update();


  }

}
