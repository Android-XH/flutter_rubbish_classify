import 'package:dio/dio.dart';
import 'package:rubbishclassify/request/json_util.dart';
import 'package:rubbishclassify/util/log_util.dart';

/// 初始化dio
Dio initDio(String _baseUrl, String _appCode) {
  BaseOptions _baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      responseType: ResponseType.json,
      receiveTimeout: 1000 * 10,
//      headers: headers,
      connectTimeout: 1000 * 10);
  Dio dio = Dio(_baseOptions);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
    options.headers.remove("content-type");
    options.headers.addAll({
      "Authorization": "APPCODE $_appCode",
//      "Content-Type": "application/octet-stream; charset=utf-8",
      "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//      "Content-Type": "application/json; charset=UTF-8"
    });
    return options;
  }, onResponse: (Response response) async {
    JsonUtil.printRespond(response);
    return response;
  }, onError: (DioError e) async {
    // G.toast(e.message);
    // 当请求失败时做一些预处理
    LogUtil.e("访问异常：$_baseUrl ---${e.request.headers}");
    return e; //continue
  }));

  return dio;
}
