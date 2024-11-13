// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nft_flutter/app/module/announcement_center/view.dart';
import 'package:nft_flutter/app/module/begin_guide_page/view.dart';
import 'package:nft_flutter/app/module/buy/order_detail_page/view.dart';
import 'package:nft_flutter/app/module/collection/primary_collection_detail/view.dart';
import 'package:nft_flutter/app/module/digital_identity/view.dart';
import 'package:nft_flutter/app/module/hall/search/view.dart';
import 'package:nft_flutter/app/module/main_tab/view.dart';
import 'package:nft_flutter/app/module/user/operation_pwd/view.dart';
import 'package:nft_flutter/app/module/user/user_auth/item/face_verify_page.dart';
import 'package:nft_flutter/app/module/user/user_auth/view.dart';
import 'package:nft_flutter/app/module/user/user_profile/view.dart';
import 'package:nft_flutter/app/module/user/userinfo/mine/view.dart';
import 'package:nft_flutter/app/module/user/userinfo/view.dart';

import '../data/base_api.dart';
import '../module/announcement_center/announcement_detail/view.dart';
import '../module/brand_details/view.dart';
import '../module/collection/assets_collection_detail/view.dart';
import '../module/collection/consignment/view.dart';
import '../module/collection/secondary_collection_detail/view.dart';
import '../module/collection_group_detail/view.dart';
import '../module/main_tab/logic.dart';
import '../module/original_stone/view.dart';
import '../module/splash/view.dart';
import '../module/user/login/binding.dart';
import '../module/user/login/view.dart';
import '../module/user/order_list/view.dart';
import '../module/user/recommend_friends/view/invite_record_view.dart';
import '../module/user/recommend_friends/view.dart';
import '../module/user/recommend_friends/view/invite_rules _view.dart';
import '../module/user/user_auth/item/alive_page.dart';
import '../module/user/userinfo/about/view.dart';
import '../module/user/userinfo/log_off_account/view.dart';
import '../module/user/userinfo/recommender/view.dart';
import '../module/user/userinfo/redeem_code/view.dart';
import '../module/user/userinfo/set/view.dart';
import '../module/webview/webview_page.dart';

class AppRoutes {
  static const initial = '/splash';

  //主页tab
  static const mainTabPage = '/mainTabPage';

  ///d登录
  static const login = '/login';

  static const changeNickname = '/changeNickname';

  static const redeemCode = '/redeemCode';
  static const minePage = '/minePage';
  // 用户资料
  static const userProfilePage = '/userProfilePage';
  ///订单列表
  static const orderListPage = '/orderListPage';
  ///品牌详情
  static const brandDetailsPage = '/brandDetailsPage';
  ///一级市场-藏品详情
  static const primaryCollectionDetailPage = '/primaryCollectionDetailPage';
  ///二级市场-藏品详情
  static const secondaryCollectionDetailPage = '/secondaryCollectionDetailPage';
  ///藏品挂单详情页面
  static const collectionGroupDetailPage = '/collectionGroupDetailPage';
  ///资产藏品详情页面
  static const assetsCollectionDetailPage = '/assetsCollectionDetailPage';
  ///寄售详情页面
  static const consignmentPage = '/consignmentPage';
  static const webView = '/webView';
  static const recommenderPage = '/recommenderPage';
  static const setPage = '/setPage';
  static const aboutPage = '/aboutPage';

  ///公告中心
  static const announcementCenterPage = '/announcementCenterPage';
  ///公告详情
  static const announcementDetailPage = '/announcementDetailPage';
  ///搜索
  static const searchPage = '/searchPage';
  ///新手引导
  static const beginGuidePage = '/beginGuidePage';
  ///实名认证
  static const userAuth = '/userAuth';
  ///人脸识别
  static const faceVerify = '/faceVerify';
  static const alivePage = '/alivePage';

  static const operationPwd = '/operationPwd';

  static const recommendFriendsPage = '/recommendFriendsPage';
  static const recommendRulesPage = '/recommendRulesPage';
  static const recommendRecordPage = '/recommendRecordPage';

  /// 注销账号
  static const logOffAccountPage = '/logOffAccountPage';

  ///订单闲情
  static const orderDetail = '/orderDetail';
  ///数字身份
  static const digitalIdentityPage = '/digitalIdentityPage';
  ///元石
  static const originalStonePage = '/OriginalStonePage';


  static final routes = [
    GetPage(name: initial, page: () =>  SplashPage()),
    GetPage(name: mainTabPage, page: () => MainTabPage()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: changeNickname, page: () => ChangeNicknamePage()),
    GetPage(name: redeemCode, page: () => RedeemCodePage()),
    GetPage(name: minePage, page: () => MinePage()),
    GetPage(name: aboutPage, page: () => AboutPage()),
    GetPage(name: recommenderPage, page: () => RecommenderPage()),
    GetPage(name: setPage, page: () => SetPage()),
    GetPage(name: userProfilePage, page: () => UserProfilePage()),
    GetPage(name: orderListPage, page: () => OrderListPage()),
    GetPage(name: recommendFriendsPage, page: () => RecommendFriendsPage()),
    GetPage(name: recommendRulesPage, page: () => RecommendRulesPage()),
    GetPage(name: recommendRecordPage, page: () => RecommendRecordPage()),
    GetPage(name: logOffAccountPage, page: () => LogOffAccountPage()),

    GetPage(
        name: brandDetailsPage,
        page: () {
          /// 时间戳赋值 跳转标签
          presentCount = DateTime.now().millisecondsSinceEpoch;
          return BrandDetailsPage();
        }),
    GetPage(
        name: primaryCollectionDetailPage,
        page: () {
          /// 时间戳赋值 跳转标签
          presentCount = DateTime.now().millisecondsSinceEpoch;
          return PrimaryCollectionDetailPage();
        }),
    GetPage(
        name: secondaryCollectionDetailPage,
        page: () {
          /// 时间戳赋值 跳转标签
          presentCount = DateTime.now().millisecondsSinceEpoch;
          return SecondaryCollectionDetailPage();
        }),
    GetPage(
      name: collectionGroupDetailPage,
      page: () {
        /// 时间戳赋值 跳转标签
        presentCount = DateTime.now().millisecondsSinceEpoch;
        return CollectionGroupDetailPage();
      },
    ),
    GetPage(
      name: consignmentPage,
      page: () {
        /// 时间戳赋值 跳转标签
        presentCount = DateTime.now().millisecondsSinceEpoch;
        return ConsignmentPage();
      },
    ),
    GetPage(
      name: assetsCollectionDetailPage,
      page: () {
        /// 时间戳赋值 跳转标签
        presentCount = DateTime.now().millisecondsSinceEpoch;
        return AssetsCollectionDetailPage();
      },
    ),

    GetPage(name: webView, page: () => const WebViewPage(),),
    GetPage(name: announcementCenterPage, page: () => const AnnouncementCenterPage(),),
    GetPage(name: announcementDetailPage, page: () => AnnouncementDetailPage(),),
    GetPage(name: searchPage, page: () => SearchPage(),),


    GetPage(name: beginGuidePage, page: () => const BeginGuidePage()),
    GetPage(name: '/pages/home/beginnerGuide', page: () => const BeginGuidePage()),
    GetPage(name: userAuth, page: () => UserAuthPage()),
    GetPage(name: faceVerify, page: () => FaceVerifyPage()),
    GetPage(name: alivePage, page: () => LivePage()),
    GetPage(name: orderDetail, page: () => OrderDetailPage()),
    GetPage(name: digitalIdentityPage, page: () => DigitalIdentityPage()),
    GetPage(name: operationPwd, page: () => OperationPwdPage()),
    GetPage(name: originalStonePage, page: () => OriginalStonePage()),

  ];
}
