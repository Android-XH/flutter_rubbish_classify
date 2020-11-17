import 'package:dio/dio.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

class ReqSearchTxt {
  Dio _dio;

  ReqSearchTxt(this._dio);

  /// 搜索垃圾属性
  Future<SearchTxtData> searchRecoverWord(String keyWord) {
    return _dio.get('/recover_word', queryParameters: {"name": keyWord}).then((value) {
      return SearchTxtEntity().fromJson(value.data).data;
    });
  }
}
