import 'package:flutter/material.dart';
import 'package:nft_flutter/app/module/user/userinfo/mine/view.dart';
import 'package:nft_flutter/common/widgets/keep_alive_wrapper.dart';

import '../../../common/index.dart';
import '../../../common/widgets/double_press_back.dart';
import '../../../common/widgets/navigation_x.dart';
import '../ecology/view.dart';
import '../hall/view.dart';
import '../home/view.dart';
import 'logic.dart';

class MainTabPage extends StatelessWidget {
  MainTabPage({Key? key}) : super(key: key);

  final logic = Get.put(MainTabLogic());

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      child:
      SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: PageView(
            controller: logic.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:  [
              KeepAliveWrapper(child: HomePage(),),
              KeepAliveWrapper(child: EcologyPage(),),
              const KeepAliveWrapper(child: HallPage(),),
              KeepAliveWrapper(child: MinePage(),),
            ],
          ),
          bottomNavigationBar: GetBuilder<MainTabLogic>(builder: (logic) {
            return buildBottom();
          }),

        ),
      ),
    );
  }

  buildBottom() {
    return NavigationX(
      currentIndex: logic.tabIndex, // 当前选中的tab索引
      onTap: (index) {
       logic.changeToPage(index);
      }, // 切换tab事件
      items: [
        NavigationItemModel(
          label: '首页',
          icon: 'home.png'.skImagePath,
          selectedIcon: 'homeSelect.png'.skImagePath,
          dot: false,
        ),
        NavigationItemModel(
          label: '孵化',
          icon: 'ecology.png'.skImagePath,
          selectedIcon: 'ecologySelect.png'.skImagePath,
          dot: false,
        ),
        NavigationItemModel(
          label: '大厅',
          icon: 'market.png'.skImagePath,
          selectedIcon: 'marketSelect.png'.skImagePath,
          dot: false,
        ),
        NavigationItemModel(
          label: '我的',
          icon: 'my.png'.skImagePath,
          selectedIcon: 'mySelect.png'.skImagePath,
          dot: false,
        ),

      ],
    );
  }
}
