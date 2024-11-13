import 'dart:io';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import '../../../common/http/http/dio_new.dart';
import '../../data/base_api.dart';
import '../../module/user/recommend_friends/withdrawal_details_bean.dart';
import '../../module/user/userinfo/mine/Consignment_list_bean.dart';
import '../../module/user/userinfo/mine/My_assets_list_bean.dart';
import '../network_manager.dart';

/// - 01、账号相关
extension AccountNetworkManager on NetworkManager {


  ///1 发送登录手机验证码 /sendLoginVerificationCode?NECaptchaValidate=C&mobile=19192064547
  Future<HttpResponse> sendSmsCode(String mobile,String captchaValidate) {
    var data = {
      'mobile': mobile,
      'NECaptchaValidate':captchaValidate
    };
    return NetworkManager().get('/sendLoginVerificationCode',queryParameters: data);
  }




  ///2 登录
  Future<HttpResponse> login(String mobile,String verificationCode,
      {String ? inviteCode}) {

    var data = {
      'mobile': mobile,
      'verificationCode': verificationCode,
    };

    if(inviteCode != null){
      data['inviteCode'] = inviteCode;
    }
    return NetworkManager().post('/login',params: data);
  }


  ///3 获取用户信息
  Future<HttpResponse> getUserInfo() {
    return NetworkManager().get('/member/getMyPersonalInfo');
  }

  /// 修改用户昵称
  Future<HttpResponse> updateNickName(String nickname) {
    var data = {
      'nickName': nickname,
    };
    return NetworkManager().post('/member/updateNickName',params: data);
  }

  /// 获取我的生态资产
  Future<MyAssetsListBean?> getEcologicalAssetsList(
      {int pageNum = 1, int pageSize = 6, String commodityType = '3'}) async {
    var res = await NetworkManager().get('/myArtwork/findMyHoldCollectionListByPage',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize, 'commodityType': commodityType});
    // /api/myArtwork/findMyHoldCollectionListByPage?pageSize=10&commodityType=3&pageNum=1
    http://175.27.138.121:8088/api/myArtwork/findMyHoldCollectionListByPage?pageSize=10&commodityType=3&pageNum=1
    MyAssetsListBean ? result;
    if (res.success && res.data != null) {
      result = MyAssetsListBean.fromJson(res.data);
    }
    return result;
  }

  /// 获取我的自由资产
  Future<MyAssetsListBean?> getFreeAssetsList(
      {int pageNum = 1, int pageSize = 6, String commodityType = '1'}) async {
    var res = await NetworkManager().get('/myArtwork/findMyHoldCollectionListByPage',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize, 'commodityType': commodityType});
    MyAssetsListBean ? result;
    if (res.success && res.data != null) {
      result = MyAssetsListBean.fromJson(res.data);
    }
    return result;
  }

  // 获取我的资产
  Future<HttpResponse?> getMyBalance() async {
    return NetworkManager().get('/member/getBalance');
  }

  // 兑换码
  Future<HttpResponse> exchangeCode(String code) {
    var data = {
      'code': code,
    };
    return NetworkManager().post('/exchangeCode/exchange',params: data);
  }

  // 推荐人绑定
  Future<HttpResponse> updateMyInvite(String inviteCode) {
    var data = {
      'inviteCode': inviteCode,
      'id': UserInfoManager().loginResultBean.accountId,
    };
    return NetworkManager().post('/member/updateMyInvite',params: data);
  }

 // 寄售列表
  Future<List<ConsignmentListItemBean>> findMyHoldCollectionByPage( {int pageNum = 1, int pageSize = 6, required String collectionId}) async {
    var res = await NetworkManager().get('/myArtwork/findMyHoldCollectionByPage',
        queryParameters: {'pageNum': '1', 'pageSize': '100', 'collectionId': collectionId});
    List<ConsignmentListItemBean> list = [];
    if (res.success && res.data != null) {
      ConsignmentListBean listBean = ConsignmentListBean.fromJson(res.data);
      if (listBean.content != null) {
        list = listBean.content ?? [];
      }
    }
    return list;
    // return NetworkManager().get('/transaction/findMyPayOrderByPage',queryParameters: data);
  }

  // 推荐好友列表
  // http://175.27.138.121:8088/api/member/findMyInviteRecord
  Future<HttpResponse> getInviteFriendsList( {int pageNum = 1, int pageSize = 10}) async {
    var res = await NetworkManager().get('/member/findMyInviteRecord',
        queryParameters: {'pageNum': pageNum, 'pageSize': '100', 'issuerId':'','commodityType':'3'});
    return res;
    // http://175.27.138.121:8088/api/member/findMyInviteRecord?issuerId=&commodityType=3&pageSize=20&pageNum=1
  }
  // 提现明细
  Future<List<WithdrawalDetailsItemBean>> getQueryRedPageList( {int pageNum = 1, int pageSize = 10}) async {
    var data = {
      'pageNum': pageNum,
      'pageSize': pageSize,
      'accountId': NetworkManager().accountId,
      'currPage': '1',
      'changeType': '',
    };
    var res = await NetworkManager().post('${BaseApi.kPayUrl}/payment/queryRedPage',
        params: data,contentType: NetworkManager.contentTypeJson);
    List<WithdrawalDetailsItemBean> list = [];
    if (res.success && res.data != null) {
      WithdrawalDetailsBean listBean = WithdrawalDetailsBean.fromJson(res.data);
      if (listBean.list != null) {
        list = listBean.list ?? [];
      }
    }
    return list;
    // var res = await NetworkManager().get('/payment/queryRedPage',
    //     queryParameters: {'pageNum': pageNum, 'pageSize': '100',});
    // test.yuanyushuzi.cn/payment/queryRedPage
    // var res = await NetworkManager().post('${BaseApi.kPayUrl}/payment/queryRedPage',
    //     params: data,contentType: NetworkManager.contentTypeJson);
    // return res;
  }

  // 修改头像
  Future<HttpResponse> uploadFile( {required File uploadFile}) async {
    FormData formData = FormData.fromMap({
      'file_data': await MultipartFile.fromFile(uploadFile.path, filename: 'avatar.jpg'),
    });
    var res = await NetworkManager().postUploadFile('/member/updateAvatar',
        formData: formData);
    return res;
  }

  //http://test.yuanyushuzi.cn/payment/validMultipleAuth

///实名认证-contentType为json。正常接口为from
  Future<HttpResponse> userVerifyAuth(Map<String,String> data) {
    return NetworkManager().post('${BaseApi.kPayUrl}/payment/validMultipleAuth',params: data,contentType: NetworkManager.contentTypeJson);
  }



  /// 发送操作密码手机验证码 /member/sendModifyPayPwdVerificationCode
  Future<HttpResponse> sendModifySmsCode(String mobile,String captchaValidate) {
    var data = {
      'mobile': mobile,
      'NECaptchaValidate':captchaValidate
    };
    return NetworkManager().get('/member/sendModifyPayPwdVerificationCode',queryParameters: data);
  }

  ///设置操作密码-/member/modifyPayPwd
  Future<HttpResponse> modifyPayPwd(String verificationCode,String newPwd) {
    var data = {
      'verificationCode':verificationCode,
      'newPwd':newPwd,
    };
    return NetworkManager().post('/member/modifyPayPwd',params: data,);
  }

  ///获取我的收益
  Future<HttpResponse> getMyAssets( {int pageNum = 1, int pageSize = 10}) {
    var data = {
      'pageNum': pageNum,
      'pageSize': pageSize,
    };
    return NetworkManager().get('/member/getMyAssets',queryParameters: data);
  }

}


