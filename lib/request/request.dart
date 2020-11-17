import 'package:dio/dio.dart';
import 'package:rubbishclassify/request/init_dio.dart';
import 'package:rubbishclassify/request/req_search_img.dart';
import 'package:rubbishclassify/request/req_search_txt.dart';
import 'package:rubbishclassify/request/req_search_voice.dart';



class Request {
  String _appCode="0265c1be5a9a471594222e237a0546a5";

  Dio _txtDio;
  ///文字搜索垃圾信息
  String _txtBaseUrl="https://recover2.market.alicloudapi.com";


  Dio _imgDio;
  String _imgBaseUrl="https://recover.market.alicloudapi.com";

  Dio _voiceDio;
  String _voiceBaseUrl="http://aip.market.alicloudapi.com";


  Request() {
//    Map headers={"Authorization": "APPCODE $_appCode"};
    _txtDio = initDio(_txtBaseUrl,_appCode);
//    headers.addAll({"Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"});
    _imgDio = initDio(_imgBaseUrl,_appCode);
//    headers.remove("Content-Type");
//    headers.addAll({"Content-Type":"application/json; charset=UTF-8"});
    _voiceDio=initDio(_voiceBaseUrl,_appCode);
  }

  ReqSearchTxt get reqSearchTxt  => ReqSearchTxt(_txtDio);
  ReqSearchImg get reqSearchImg  => ReqSearchImg(_imgDio);
  ReqSearchVoice get reqSearchVoice => ReqSearchVoice(_voiceDio);
}