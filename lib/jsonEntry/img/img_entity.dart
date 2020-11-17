import 'package:rubbishclassify/generated/json/base/json_convert_content.dart';
import 'package:rubbishclassify/generated/json/base/json_filed.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

class ImgEntity with JsonConvert<ImgEntity> {
	int ret;
	List<ImgData> data;
	double qt;
}

class ImgData with JsonConvert<ImgData> {
	double score;
	String keyword;
	@JSONField(name: "list")
	List<SearchTxtDataList> xList;
}

