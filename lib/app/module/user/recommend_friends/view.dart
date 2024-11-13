import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/recommend_friends/view/cashout_type_dialog.dart';
import 'package:nft_flutter/app/module/user/recommend_friends/view/poster_dialog.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';
import '../../../../common/http/http/src/http_exceptions.dart';
import '../../../../common/utils/log_util.dart';
import '../../../../common/widgets/image_x.dart';
import '../../../widgets/empty_view.dart';
import '../../../widgets/tips_dialog.dart';
import '../../collection/consignment/item/pwd_dialog.dart';
import 'logic.dart';
import 'package:hb_password_input_textfield/hb_password_input_textfield.dart';

class RecommendFriendsPage extends StatelessWidget {
  RecommendFriendsPage({Key? key}) : super(key: key);

  final RecommendFriendsLogic logic = Get.put(RecommendFriendsLogic());

  final TextEditingController _controller = TextEditingController();
  final FocusNode _node = FocusNode();

  buildItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, top: 16.w),
              child: ClipOval(
                child: SizedBox(
                  width: 36.w,
                  height: 36.w,
                  // color: Colors.orange,
                  child: Image.asset(
                    'head_defalut.png'.imagePath,
                    width: 36.w,
                    height: 36.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  '${logic.inviteFriendsList[index]['mobile'] ?? ''}',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: 1.skColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${logic.inviteFriendsList[index]['inviterTime'] ?? ''}',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: 3.skColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: 15.w, top: 10.w),
          child: Text(
            logic.inviteFriendsList[index]['isWalletStatus'] == true
                ? '已开通'
                : '未开通',
            style: TextStyle(
                fontSize: 12.sp, color: 3.skColor, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: Container(
        height: ScreenUtil().screenHeight,
        color: 4.skColor,
        child: Stack(
          children: [
            GestureDetector(
              // onTap: () {
              //   Navigator.pushNamed(context, MineMessage.ROUTE_PATH);
              // },
              child: Container(
                margin: EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/recommend_friends_bg.png'),
                      fit: BoxFit.fill,
                    )),
                height: 203.w,
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 0),
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 15.w, right: 15.w, top: kTextTabBarHeight + 56.w),
                  height: 116.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // 设置圆角的半径
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16.w, top: 16.w),
                            child: Text(
                              '我的邀请奖励',
                              style:
                                  TextStyle(color: 1.skColor, fontSize: 14.sp),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16.w, top: 10.w),
                            child: Text(
                              '¥${UserInfoManager().userInfoBean?.cardBalance}',
                              style: TextStyle(
                                  color: const Color.fromRGBO(255, 83, 21, 1),
                                  fontSize: 14.sp),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16.w, top: 16.w),
                            child: Text(
                              '每日最多可提现3次，单日最多提现10,000元',
                              style:
                                  TextStyle(color: 3.skColor, fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 21.w),
                            child: Container(
                              height: 36.w,
                              width: 68.w,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 63, 26, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: GestureDetector(
                                onTap: () {
                                  if (UserInfoManager()
                                      .userInfoBean
                                      ?.authStatus == 0) {
                                    dialogRealName();
                                  } else {
                                    dialogShow(context);
                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    '提现',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // GetBuilder<RecommendFriendsLogic>(builder: (logic) {
                //   return Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         padding: EdgeInsets.only(left: 16.sp, top: 16.sp),
                //         child: Text(
                //           '累计邀请 ${logic.inviteFriendsList.length} 人',
                //           style: TextStyle(color: 9.skColor, fontSize: 14.sp),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Get.toNamed(AppRoutes.recommendRulesPage);
                //         },
                //         child: Container(
                //           padding: EdgeInsets.only(right: 16.sp, top: 20.sp),
                //           child: Text(
                //             '邀请规则',
                //             style: TextStyle(color: 1.skColor, fontSize: 12.sp),
                //           ),
                //         ),
                //       )
                //     ],
                //   );
                // }),

                Container(
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.w),
                  height: 116.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // 设置圆角的半径
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16.sp, top: 16.sp),
                            child: Text(
                              '我的邀请',
                              style:
                                  TextStyle(color: 1.skColor, fontSize: 12.sp),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.recommendRulesPage);
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(right: 16.sp, top: 20.sp),
                              child: Text(
                                '邀请规则',
                                style: TextStyle(
                                    color: 0.skColor, fontSize: 12.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 12.sp, top: 12.sp),
                            child: Text(
                              '累计邀请(人)',
                              style:
                                  TextStyle(color: 3.skColor, fontSize: 14.sp),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.recommendRulesPage);
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(right: 16.sp, top: 12.sp),
                              child: Text(
                                '开通钱包(人)',
                                style: TextStyle(
                                    color: 3.skColor, fontSize: 12.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                      GetBuilder<RecommendFriendsLogic>(builder: (logic) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 16.sp, top: 6.sp),
                              child: Text(
                                '${logic.inviteFriendsList.length}',
                                style: TextStyle(
                                    color: 1.skColor, fontSize: 20.sp),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.recommendRulesPage);
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(right: 16.sp, top: 6.sp),
                                child: Text(
                                  '${UserInfoManager().userInfoBean?.walletOpenCount ?? 0}',
                                  style: TextStyle(
                                      color: 1.skColor, fontSize: 20.sp),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // 设置圆角的半径
                  ),
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w),
                  height: 360.w,
                  child: GetBuilder<RecommendFriendsLogic>(builder: (logic) {
                    return logic.inviteFriendsList.length == 0
                        ? EmptyView()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: 16.sp, top: 16.sp),
                                child: Text(
                                  '邀请记录',
                                  style: TextStyle(
                                      color: 1.skColor, fontSize: 14.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 16.sp, top: 6.sp),
                                    child: Text(
                                      '用户信息',
                                      style: TextStyle(
                                          color: 3.skColor, fontSize: 12.sp),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 15.sp, top: 6.sp),
                                    child: Text(
                                      '钱包状态',
                                      style: TextStyle(
                                          color: 3.skColor, fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0.w),
                                      itemCount: logic.inviteFriendsList.length,
                                      itemBuilder: (context, index) {
                                        // OrderListItemBean bean =  logic.orderList[index];
                                        return buildItem(index);
                                      }))
                            ],
                          );
                  }),
                ),
                Expanded(child: Text('')),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        isScrollControlled:true,
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                                height: double.infinity, child: PosterDialog())))
                        .then((value) async {
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.w, right: 15.w),
                    height: 40.w,
                    width: 154.w,
                    decoration: BoxDecoration(
                        color: 0.skColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: Text(
                        '生成我的邀请海报',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: kTextTabBarHeight + 13.w, left: 15.w),
                      child: ImageX.asset(
                        'icon_back.png'.skImagePath,
                        width: 20.w,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: kTextTabBarHeight + 13.w, left: 30.w),
                  child: Text(
                    '推荐好友',
                    style: TextStyle(
                        color: 1.skColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.recommendRecordPage);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: kTextTabBarHeight + 13.w, right: 15.w),
                    child: Text(
                      '提现明细',
                      style: TextStyle(
                          color: 1.skColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 提现成功弹框
  void showAlertDialog(String title, BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: AlertDialog(
              title: Center(
                  child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Image.asset(
                            'assets/images/bottom_close.png',
                            width: 12.w,
                            height: 12.w,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('提现成功',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: 1.skColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Text('¥ 2.00',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: 1.skColor,
                      )),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text('扣除手续费（6%）0.21 元 提现到易宝钱包',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: 3.skColor,
                      )),
                  SizedBox(
                    height: 12.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      ToastUtil.showToast('未开通');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      height: 40.w,
                      // width: 154.w,
                      decoration: BoxDecoration(
                          color: 0.skColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          '进入易宝钱包',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            // actions: [
            //   Column(
            //     children: [
            //       Text('¥ 2.00'),
            //       Text('¥ 2.00'),
            //       const SizedBox(
            //         height: 25,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           InkWell(
            //             onTap: () {
            //               Navigator.pop(context);
            //             },
            //             // child: Container(
            //             //   height: 44,
            //             //   width: 123,
            //             //   padding: const EdgeInsets.all(5),
            //             //   decoration: const BoxDecoration(
            //             //     color: Colors.transparent,
            //             //     image: DecorationImage(
            //             //       image: AssetImage('images/zhidaolebtn.png'),
            //             //       // image: NetworkImage('https://ljnk.libaokj.com/upload/pic/dw_exchange_1.jpg'),
            //             //       fit: BoxFit.cover,
            //             //     ),
            //             //   ),
            //             //   // child: Text('知道了'),
            //             // ),
            //           ),
            //           InkWell(
            //             onTap: () {
            //
            //             },
            //             child: Container(
            //               height: 44,
            //               width: 123,
            //               padding: const EdgeInsets.all(6),
            //               // decoration: const BoxDecoration(
            //               //     borderRadius: BorderRadius.all(
            //               //       Radius.circular(4),
            //               //     ),
            //               //     color: Colors.greenAccent),
            //               // decoration: const BoxDecoration(
            //               //   color: Colors.transparent,
            //               //   image: DecorationImage(
            //               //     image: AssetImage('images/lijishiyongBtn.png'),
            //               //     // image: NetworkImage('https://ljnk.libaokj.com/upload/pic/dw_exchange_1.jpg'),
            //               //     fit: BoxFit.cover,
            //               //   ),
            //               // ),
            //               // child: const Text(
            //               //   '立即使用',
            //               //   style: TextStyle(color: Colors.white),
            //               // ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 15,
            //       ),
            //     ],
            //   )
            // ],
          );
        });
  }

  // 输入密码弹框
  void showPswAlertDialog(String title, BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Center(
                  child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 0),
                          child: Image.asset(
                            'assets/images/bottom_close.png',
                            width: 12.w,
                            height: 12.w,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('全部提现',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: 1.skColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Text('请输入操作密码',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: 3.skColor,
                      )),
                  SizedBox(
                    height: 6.w,
                  ),
                  Container(
                    width: 600.w,
                    child: pswInput(context),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // 跳转操作密码
                    },
                    child: Align(
                      child: Container(
                        padding: EdgeInsets.only(right: 15.w),
                        height: 40.w,
                        child: Text(
                          '重新设置密码',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: 0.skColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }

  // 生成海报
  // void showPosterDialog(String title, BuildContext context) {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return GestureDetector(
  //             onTap: () {
  //               Navigator.pop(context);
  //             },
  //             child: Column(
  //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                     padding: EdgeInsets.only(right: 15),
  //                     child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text('X', style: TextStyle(fontSize: 25.sp, color: Colors.white),),
  //                   ],)),
  //                 Image.asset(
  //                   'head_defalut.png'.imagePath,
  //                   // width: 64.w,
  //                   // height: 164.w,
  //                   fit: BoxFit.cover,
  //                 ),
  //                 Text('11113123219999'),
  //                 Padding(padding: EdgeInsets.only(top:280), child: AlertDialog(
  //                   backgroundColor: Colors.white,
  //                   title: Column(
  //                     children: [
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                       Text('3123219999'),
  //                     ],
  //                   ),
  //                 ),)
  //               ],
  //             ));
  //       });
  // }

  void dialogShow(BuildContext context) {
    Get.bottomSheet(ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: 220.h,
          child: GetBuilder<RecommendFriendsLogic>(
              id: 'ecologDialog',
              builder: (logic) {
                return CashoutTypeDialog('');
              }),
        ))).then((value) async {
      if (value == 'yibao') {
        _controller.text = '';
        // showPswAlertDialog('', context);
        var pwd = await Get.dialog(const PwdDialog(
          title: '全部提现',
          content: '请输入操作密码',
        ));
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        if (pwd != null && pwd.toString().isNotEmptyOrNull) {
          try {
            showAlertDialog('', context);
          } on DMRequestException catch (e) {
            LoggerUtil.e(e);
          }
        }
      }
    });
  }

  Widget pswInput(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _node.unfocus();
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: HBPasswordInputTextField(
            backgroundColor: Colors.white,
            fillColor: 22.skColor,
            borderWidth: 0,
            borderRaiuds: 5,
            controller: _controller,
            node: _node,
            obscureText: true,
            obscureTextString: "*",
            boxWidth: 35.w,
            boxHeight: 44.w,
            type: HBPasswordInputTextFieldType.BOXES,
            length: 6,
            textStyle: const TextStyle(fontSize: 20),
            onChange: (text) {
              if (text.length == 6) {
                _node.unfocus();
                Navigator.pop(context);
                showAlertDialog('', context);
              }
            },
            borderColor: Colors.white,
            spacing: 10,
          ),
        ));
  }

  void dialogRealName() {
    Get.dialog(TipsDialog(
      title: '提示',
      confirmTitle: '前往认证',
      content:
      '请先实名认证后，再进行购买。\n 根据《支付机构反洗钱和反恐怖融资管理办法》等法规要求，请先完成实名认证后再进行购买。',
      onPressed: (bool result) {
        if (result) {
          Get.toNamed(AppRoutes.userAuth);
        }
      },
    ));
  }

}
