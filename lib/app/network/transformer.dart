
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';

import '../../common/http/http/dio_new.dart';
import '../../common/http/http/src/http_transformer.dart';
import '../../common/index.dart';

///DEFAULT
class DMDefaultTransformer extends HttpTransformer {

  @override
  HttpResponse parse(Response response) {

    var data = response.data;
    int code = data["code"];
    switch (code) {
      case 0:
      case 200:
        return HttpResponse.success(data["data"]);
      case 999:
        UserInfoManager().logout();
        Get.toNamed(AppRoutes.login);
        return DMRequestException( data['code'], data['msg']);
      case 401:
        return DMRequestException( data['code'], data['msg']);
      case 1001:
        return DMRequestException( data['code'], data['msg']);
      default:

        var msg  = data['msg'];
        return DMRequestException( data['code'], msg ?? data['message'],errorExpands: data['errorExpands']);
    }

  }

  /// 单例对象
  static final DMDefaultTransformer _instance = DMDefaultTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DMDefaultTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DMDefaultTransformer.getInstance() => _instance;

}
