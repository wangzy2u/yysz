import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

import '../../../../../common/widgets/appbar_x.dart';
import '../logic.dart';

class RecommendRulesPage extends StatelessWidget {
  RecommendRulesPage({Key? key}) : super(key: key);

  final RecommendFriendsLogic logic = Get.put(RecommendFriendsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 22.skColor,
      appBar: buildAppbar(title: '邀请规则'),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Color.fromRGBO(249, 251, 255, 1.0),
        ),
        margin: EdgeInsets.only(left: 15.w,right: 15.w, top: 12.w,bottom: 90.w),
        // color: Colors.white,
        child: SingleChildScrollView(child: Container(
          margin: EdgeInsets.only(left: 15.w,right: 15.w, top: 12.w, bottom: 15.w),
          child: Text('${logic.tagList[0].dictItemName}'))),
          // child: Text('1. **精彩内容** - 本次活动将有[知名嘉宾/专业团队]带来的[精彩表演/专业讲座]，内容涵盖[相关领域/主题]，让你在轻松愉快的氛围中获取新知识、新见解。 - 还设置了丰富多样的互动环节，你可以与其他参与者一起交流、合作，共同完成有趣的任务，结交志同道合的朋友。 2. **独特体验** - 活动场地独具特色，[描述场地的独特之处，如美丽的自然风光、独特的建筑风格等]，为你提供一个与众不同的活动环境，让你在享受活动的同时，也能感受到别样的氛围。 - 我们还为参与者准备了特别的惊喜，包括[列举一些惊喜，如限量版纪念品、美食体验等]，让你留下难忘的回忆。\n 1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址] \n 1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址] 1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址]1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址]1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址]1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址]1. **活动名称**：[具体活动名称] 2. **活动时间**：[开始时间]-[结束时间]（[具体日期]，[星期 X]）  3. **活动地点**：[详细地址]'),),),
      ),
    );
  }

}
