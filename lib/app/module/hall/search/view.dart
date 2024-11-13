import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';

import '../../../../common/widgets/icon_x.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../../common/widgets/list/refresh_more_widget.dart';
import '../../../routes/app_routes.dart';
import '../item/item_assets_view.dart';
import 'logic.dart';

///搜索
class SearchPage extends StatelessWidget with RefreshLoadMoreWidget {
  SearchPage({Key? key}) : super(key: key);

  final SearchLogic logic = Get.put(SearchLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      appBar: buildSearchBar(),
      body: GetBuilder<SearchLogic>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.only(top: 12.w),
          child: buildWidget(
              child: logic.marketCollectionList.isNotEmpty
                  ? GridView.builder(
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
                                'collectionId': logic
                                        .marketCollectionList[index]
                                        .collectionId ??
                                    ''
                              });
                        });
                      }).paddingSymmetric(horizontal: 15.w)
                  :  EmptyView(icon: 'icon_search_empty.png'.skImagePath,)),
        );
      }),
    );
  }

  buildSearchBar() {
    return AppBar(
      titleSpacing: 0.w,
      leadingWidth: 45.w,
      backgroundColor: 2.skColor,
      foregroundColor: 2.skColor,
      scrolledUnderElevation: 0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10.w),
          child: ImageX.asset(
            'icon_back.png'.skImagePath,
            width: 20.w,
            height: 20.w,
          ),
        ),
      ),
      title: Container(
        height: 36.w,
        color: 4.skColor,
        child: Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            IconX.image(
              'icon_search_grey.png'.skImagePath,
              size: 20.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: SizedBox(
                height: 36.w,
                child: TextField(
                  autofocus: false,
                  controller: logic.searchController,
                  // focusNode: accountFn,
                  textInputAction: TextInputAction.search,

                  keyboardType: TextInputType.text,

                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: '搜索生态、数字资产',
                    hintStyle: TextStyle(fontSize: 14.sp, color: 3.skColor),
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: -10, horizontal: -10),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                    counterText: "",
                  ),

                  onSubmitted: (String str) {
                    // logic.saveSearchWord(str);
                    // Get.toNamed(Routes.searchResultPage, arguments: str);
                    // focusFn ??= FocusScope.of(context);
                    // focusFn?.requestFocus(imageCodeFn);
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                logic.search(logic.searchController.text, 1);
              },
              child: Container(
                width: 56.w,
                height: 28.w,
                color: 0.skColor,
                child: Text(
                  '搜索',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: 2.skColor,
                      fontWeight: FontWeight.w500),
                ).center(),
              ).clipRRect(all: 14.w),
            ),
            SizedBox(
              width: 4.w,
            )
          ],
        ),
      )
          .clipRRect(all: 18.w)
          .paddingAll(1.w)
          .border(all: 1.w, color: 1.skColor, radius: 18.w)
          .margin(right: 15.w),
    );
  }

  @override
  void onLoading() async {
    print(pageNum);
    var res = await logic.search(logic.searchController.text, pageNum);

    didLoadMore(res);
  }

  @override
  void onRefresh() async {
    var res = await logic.search(logic.searchController.text, pageNum);

    didRefresh(res);
  }
}
