import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/list/refresh_more_widget.dart';
import '../logic.dart';
import 'item_assets_view.dart';

/// 大厅-资产列表
class AssetsListView extends StatelessWidget with RefreshLoadMoreWidget {
  AssetsListView({super.key});

  final logic = Get.find<HallLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HallLogic>(
        id: 'AssetsListView',
        builder: (logic) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: buildWidget(
                child: logic.marketCollectionList.isNotEmpty ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.w,
                        childAspectRatio: 0.65),
                    itemCount: logic.marketCollectionList.length,
                    itemBuilder: (context, index) {
                      return ItemAssetsView(
                        itemBean: logic.marketCollectionList[index],
                      ).onTap(() {
                        Get.toNamed(AppRoutes.collectionGroupDetailPage,
                            arguments: {
                              'collectionId': logic.marketCollectionList[index]
                                      .collectionId ??
                                  ''
                            });
                      });
                    }).paddingSymmetric(horizontal: 15.w) : const EmptyView() ),
          ).paddingOnly(top: 15.w);
        });
  }

  @override
  void onLoading() async {
    print(pageNum);
    var res = await logic.getHallList(pageNum);

    didLoadMore(res);
  }

  @override
  void onRefresh() async {
    var res = await logic.getHallList(pageNum);

    didRefresh(res);
  }
}
