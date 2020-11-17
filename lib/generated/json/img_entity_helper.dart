import 'package:rubbishclassify/jsonEntry/img/img_entity.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

imgEntityFromJson(ImgEntity data, Map<String, dynamic> json) {
	if (json['ret'] != null) {
		data.ret = json['ret']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<ImgData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ImgData().fromJson(v));
		});
	}
	if (json['qt'] != null) {
		data.qt = json['qt']?.toDouble();
	}
	return data;
}

Map<String, dynamic> imgEntityToJson(ImgEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret'] = entity.ret;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['qt'] = entity.qt;
	return data;
}

imgDataFromJson(ImgData data, Map<String, dynamic> json) {
	if (json['score'] != null) {
		data.score = json['score']?.toDouble();
	}
	if (json['keyword'] != null) {
		data.keyword = json['keyword']?.toString();
	}
	if (json['list'] != null) {
		data.xList = new List<SearchTxtDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new SearchTxtDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> imgDataToJson(ImgData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['score'] = entity.score;
	data['keyword'] = entity.keyword;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}