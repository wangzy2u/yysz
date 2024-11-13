import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';
import '../../../../../common/res/langs/text_key.dart';
import '../../../../../common/widgets/big_tab_item.dart';
import '../../../../../common/widgets/image_x.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/empty_view.dart';
import '../../../main_tab/logic.dart';
import 'My_assets_list_bean.dart';
import 'consignment_bottom_dialog.dart';
import 'logic.dart';

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);

  final MineLogic logic = Get.put(MineLogic());
  final MainTabLogic mainTabLogic = Get.find<MainTabLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [6.skColor, 2.skColor], // 渐变的颜色数组
            begin: Alignment.topCenter, // 渐变开始的方向
            end: Alignment.bottomCenter, // 渐变结束的方向
          ),
        ),
        // height: Adapt.safeContentHeight,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                    // color: Colors.red,
                    height: 144.h,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              GetBuilder<UserInfoManager>(
                                  id: "MineUserInfo",
                                  builder: (userInfoManager) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular((64 / 2).w)),
                                      child: SizedBox(
                                        width: 64.w,
                                        height: 64.h,
                                        child: Image.network(
                                          '${userInfoManager.userInfoBean?.avatar ?? ''}',
                                          fit: BoxFit.cover,
                                          errorBuilder: (buildContext, object,
                                              stackTrace) {
                                            return Image.asset(
                                              'head_defalut.png'.imagePath,
                                              width: 64.w,
                                              height: 64.w,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                              SizedBox(
                                width: 12.w,
                              ),
                              GetBuilder<UserInfoManager>(
                                id: "MineUserInfo",
                                builder: (userInfoManager) {
                                  return userInfoManager.isLogin
                                      ? Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${userInfoManager.userInfoBean?.nickName}',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: 1.skColor),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  ImageX(
                                                    type: ImageType.asset,
                                                    image: (UserInfoManager()
                                                                    .userInfoBean
                                                                    ?.cardType ==
                                                                null ||
                                                            UserInfoManager()
                                                                    .userInfoBean
                                                                    ?.cardType ==
                                                                0)
                                                        ? 'mine_youke.png'
                                                            .imagePath
                                                        : UserInfoManager()
                                                                    .userInfoBean
                                                                    ?.cardType ==
                                                                1
                                                            ? 'min_jumin.png'
                                                                .imagePath
                                                            : 'min_tuanzhang.png'
                                                                .imagePath,
                                                    height: 14.w,
                                                    width: 48.h,
                                                  ).onTap(() {
                                                    Get.toNamed(AppRoutes
                                                        .digitalIdentityPage);
                                                  })
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.w,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      'UID: ${userInfoManager.userInfoBean?.uid}',
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: 9.skColor)),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    '${userInfoManager.userInfoBean?.uid}'));
                                                        ToastUtil.showToast(
                                                            '复制成功');
                                                      },
                                                      child: ImageX(
                                                        type: ImageType.asset,
                                                        image: 'copy_icon.png'
                                                            .imagePath,
                                                        height: 12.w,
                                                        width: 12.h,
                                                      )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.w,
                                              ),
                                              blockChainAddrTextWidet(
                                                  userInfoManager),
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.login);
                                          },
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('登录/注册'),
                                              Text('点击登录 享受更多精彩内容'),
                                            ],
                                          ),
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 0, right: 15),
                          // margin: const EdgeInsets.only(top: 56, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  UserInfoManager().isLogin
                                      ? Get.toNamed(
                                          AppRoutes.userProfilePage,
                                        )
                                      : Get.toNamed(
                                          AppRoutes.login,
                                        );
                                },
                                child: Container(
                                  height: 24.w,
                                  width: 64.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: 3.skColor, width: 1.0),
                                      // 设置边框线颜色和宽度
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Center(
                                    child: Text(
                                      '编辑资料',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: 1.skColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                GetBuilder<UserInfoManager>(
                    id: "MineUserInfo",
                    builder: (userManager) {
                      return userManager.isLogin
                          ? buildNumberWidget()
                          : Container();
                    }),
                SizedBox(
                  height: 12.w,
                ),
                buildGrid(),
                buildTab(),
                GetBuilder<MineLogic>(builder: (logic) {
                  // Obx(() {
                  return buildList();
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildTab() {
    // return PinnedHeaderSliver(
    //   child:
    // Obx(() {
    return Container(
      // color: 2.skColor,
      padding: EdgeInsets.only(top: 5.w),
      child: Row(
        children: [
          Obx(() {
            return BigTabItem(
              title: '生态资产',
              fontSize: 16.sp,
              isSelected: logic.appTabIndex.value == 0,
              onPressed: () {
                logic.getEcologicalAssets();
                if (logic.appTabIndex.value != 0) {
                  logic.appTabIndex.value = 0;
                }
              },
            );
          }),
          Obx(() {
            return BigTabItem(
              title: '自由资产',
              isSelected: logic.appTabIndex.value == 1,
              onPressed: () {
                logic.getFreeAssets();
                if (logic.appTabIndex.value != 1) {
                  logic.appTabIndex.value = 1;
                }
              },
            );
          }),
        ],
      ),
    );
    // });
    // );
  }

  Widget buildList() {
    int count = (logic.appTabIndex.value == 0
        ? logic.ecologicalAssetsList.length
        : logic.freeAssetsList.length);
    // if (!UserInfoManager().isLogin){
    //   count = 0;
    // }
    return count > 0
        ? Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height:
                count % 2 == 0 ? count / 2 * 240.w : (count + 1) / 2 * 240.w,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              // 设置禁止滚动
              itemCount: count,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // mainAxisExtent: 350, // item总高度
                // mainAxisExtent: 310,
                mainAxisExtent: 240,
              ),
              padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (logic.appTabIndex.value == 0) {
                      AssetsListItemBean bean =
                          logic.ecologicalAssetsList[index];
                      logic.getConsignmentList('${bean.collectionId}');
                      dialogShow(bean);
                    } else {
                      AssetsListItemBean bean = logic.freeAssetsList[index];
                      logic.getConsignmentList('${bean.collectionId}');
                      dialogShow(bean);
                    }
                  },
                  child: gridItemView(index, Map()),
                );
              },
            ),
          )
        : SizedBox(
            height: 220.w,
            child: const EmptyView(),
          );
  }

  void dialogShow(AssetsListItemBean item) {
    Get.bottomSheet(ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: SizedBox(
          height: 330.w,
          child: ConsignmentBottomDialog('${item.collectionName}'),
          // child: GetBuilder<EcologyLogic>(
          //     id: 'consignmentDialog',
          //     builder: (logic) {
          //       return ConsignmentBottomDialog('${item.collectionName}');
          //     }),
        ))).then((value) {});
  }

  Widget buildNumberWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 13, right: 13),
      height: 136.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // 设置圆角的半径
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.w,
          ),
        Obx(() {
         return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('¥${logic.assets}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: 1.skColor)),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text('我的资产(元)',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: 3.skColor)),
                ],
              ),
              Column(
                children: [
                  Text('¥${logic.mygGain}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: 1.skColor)),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text('持有收益(元)',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: 3.skColor)),
                ],
              ),
              Column(
                children: [
                  Text('${logic.mineNum}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: 1.skColor)),
                  SizedBox(
                    height: 4.w,
                  ),
                  Row(
                    children: [
                      Text('我的原石',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: 3.skColor)),
                      SizedBox(
                        width: 2.w,
                      ),
                      Image.asset(
                        'right_arrow.png'.imagePath,
                        fit: BoxFit.cover,
                        height: 10.w,
                      )
                    ],
                  )
                ],
              ).onTap(() {
                Get.toNamed(AppRoutes.originalStonePage);
              }),
            ],
          );}),
          SizedBox(
            height: 16.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.w,
                width: 154.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(27, 204, 119, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    '易宝钱包',
                    style: TextStyle(
                        fontSize: 14,
                        color: 2.skColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                height: 40.w,
                width: 154.w,
                decoration: BoxDecoration(
                    color: 0.skColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    '连连钱包',
                    style: TextStyle(
                        fontSize: 14,
                        color: 2.skColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildGrid() {
    return Container(
      // height: logic.gridHeight,
      // padding: EdgeInsets.symmetric(horizontal: 17.w),
      margin: const EdgeInsets.only(left: 13, right: 13),
      height: 80.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // 设置圆角的半径
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.orderListPage,
                  );
                },
                child: Column(
                  children: [
                    ImageX.asset(
                      'mine_dingdan.png'.imagePath,
                      width: 28.w,
                      height: 28.w,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextKey.myOrders.tr.smallContentText
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.recommendFriendsPage,
                  );
                },
                child: Column(
                  children: [
                    ImageX.asset(
                      'mine_recommend_friend.png'.imagePath,
                      width: 28.w,
                      height: 28.w,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextKey.recommendFriend.tr.smallContentText
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    ImageX.asset(
                      'mine_redemptioncode.png'.imagePath,
                      width: 28.w,
                      height: 28.w,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextKey.redemptionCode.tr.smallContentText
                  ],
                ),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.redeemCode,
                  );
                },
              ),
              GestureDetector(
                child: Column(
                  children: [
                    ImageX.asset(
                      'mine_set.png'.imagePath,
                      width: 28.w,
                      height: 28.w,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextKey.set.tr.smallContentText
                  ],
                ),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.setPage,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget gridItemView(int index, Map data) {
    // tagList = data['tag'].split('，');
    AssetsListItemBean bean;
    if (logic.appTabIndex.value == 0) {
      bean = logic.ecologicalAssetsList[index];
    } else {
      bean = logic.freeAssetsList[index];
    }
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1), //阴影颜色
              offset: Offset(0, 0), //阴影位置
              blurRadius: 1, //阴影模糊层度
              spreadRadius: 0.2, //阴影模糊大小
            ),
          ],
          color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
            child: Image.network(
              bean.collectionCover ?? '',
              // 'https://fastly.picsum.photos/id/987/200/200.jpg?hmac=9X6IIE8qZgx6bJb7rf3dZELTmfyt3rZAHw65r8_ko_4',
              // data['cover_url'],
              fit: BoxFit.cover,
              // fit: BoxFit.fitHeight,
              height: 141.h,
              width: 141.h,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 21.h,
                margin: EdgeInsets.only(left: 12.w, top: 0.w, right: 0.w),
                child: Text(
                  // ' ${data['name']}',
                  // '元域官方',
                  bean.collectionName ?? '',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: 1.skColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12.w, right: 15.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '共${bean.totalCollections}个',
                          style: TextStyle(
                              color: 3.skColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String obfuscateString(String input) {
    if (input.length <= 11) {
      // 如果字符串长度小于等于11，则不需要截断，直接返回
      return input;
    } else {
      // 截取前5个字符和后5个字符，并在中间插入六个点
      return input.substring(0, 5) +
          '******' +
          input.substring(input.length - 5);
    }
  }

  Widget blockChainAddrTextWidet(UserInfoManager userInfoManager) {
    String chainAddrStr = userInfoManager.userInfoBean?.blockChainAddr ?? '';
    return (chainAddrStr.isEmptyOrNull)
        ? const Text(
            maxLines: 1, overflow: TextOverflow.ellipsis, '区块链地址: 实名认证后生成')
        : Row(
            children: [
              Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  '区块链地址: ${obfuscateString(chainAddrStr)}',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: 9.skColor)),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: chainAddrStr));
                    ToastUtil.showToast('复制成功');
                  },
                  child: ImageX(
                    type: ImageType.asset,
                    image: 'copy_icon.png'.imagePath,
                    height: 12.w,
                    width: 12.h,
                  )),
            ],
          );
  }
}
