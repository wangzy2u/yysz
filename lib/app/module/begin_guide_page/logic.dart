import 'package:get/get.dart';

import '../../network/network_manager.dart';
import 'bean/Tutorial_item_bean.dart';

class BeginGuideLogic extends GetxController {


  List<TutorialItemBean> tutorialList = [];
  List<TutorialItemBean> guideList = [];








  @override
  void onInit() {
    super.onInit();

    getPlatformList('1');
    getPlatformList('2');
  }
  //获取教程列表 -http://175.27.138.121:8088/api/tutorials/findTutorials?type=1
  getPlatformList(String type) async {
    bool isNoMores = true;


    var res = await NetworkManager().get('/tutorials/findTutorials',
        queryParameters: {'type': type});
    if (res.success) {
      if (res.data != null) {

        List<TutorialItemBean> tempList = [];
        res.data.forEach((v) {
          tempList.add(TutorialItemBean.fromJson(v));
        });

        if(type == '1'){
          tutorialList.addAll(tempList);
        }else{
          guideList.addAll(tempList);
        }

      }
    }
    update(['TutorialView']);
    return isNoMores;
  }


  //http://localhost:8080/tutorials/addTutorialsViews
  void clickPlayUp(int type) async {
    var res = await NetworkManager().post('/tutorials/findTutorials',
        params: {'type': type});
  }
}
