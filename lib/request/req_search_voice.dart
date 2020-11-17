

import 'package:dio/dio.dart';


class ReqSearchVoice {
  Dio _dio;

  ReqSearchVoice(this._dio);

  /// 语音转换
  Future<Response> searchRecoverWord({String fileBase64}) async {
    var res=await _dio.post('/aip/speech', data:{"type":"wav","voiceBase64":fileBase64}
     );
    return res;
  }

}
