import 'package:dio/dio.dart';
import 'package:rubbishclassify/jsonEntry/img/img_entity.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

class ReqSearchImg {
  Dio _dio;

  ReqSearchImg(this._dio);

  /// 搜索垃圾属性
  Future<ImgEntity> searchRecover(String img) {
    return _dio.post(
      '/recover',
      data: {
        "img":img
      },
    ).then((value) {
      return ImgEntity().fromJson(value.data);
    });
  }
}
