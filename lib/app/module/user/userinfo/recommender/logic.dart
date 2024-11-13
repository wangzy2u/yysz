import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/account.dart';

import '../../../../../common/utils/toast_util.dart';
import '../../../../network/network_manager.dart';

class RecommenderLogic extends GetxController {
  final  isClick = false.obs;
  String recommender = '';

  void onConfirmBinding(String text) {
    recommender = text;
    isClick.value = text.isNotEmpty;
  }

  // 确认绑定
  void confirmBinding() async {
    var res  = await NetworkManager().updateMyInvite(recommender);
    if(res != null){
      ToastUtil.showToast(res.msg);
    }
    update();
  }

}
