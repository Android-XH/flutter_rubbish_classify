import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';
import 'package:rubbishclassify/jsonEntry/search_content.dart';

searchTxtEntityFromJson(SearchTxtEntity data, Map<String, dynamic> json) {
	if (json['ret'] != null) {
		data.ret = json['ret']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new SearchTxtData().fromJson(json['data']);
	}
	if (json['qt'] != null) {
		data.qt = json['qt']?.toDouble();
	}
	return data;
}

Map<String, dynamic> searchTxtEntityToJson(SearchTxtEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret'] = entity.ret;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['qt'] = entity.qt;
	return data;
}

searchTxtDataFromJson(SearchTxtData data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<SearchTxtDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new SearchTxtDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchTxtDataToJson(SearchTxtData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

searchTxtDataListFromJson(SearchTxtDataList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	return data;
}

Map<String, dynamic> searchTxtDataListToJson(SearchTxtDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['category'] = entity.category;
	return data;
}