import 'package:rubbishclassify/generated/json/base/json_convert_content.dart';
import 'package:rubbishclassify/generated/json/base/json_filed.dart';
import 'package:rubbishclassify/jsonEntry/search_content.dart';

class SearchTxtEntity with JsonConvert<SearchTxtEntity> {
  int ret;
  SearchTxtData data;
  double qt;
}

class SearchTxtData with JsonConvert<SearchTxtData> {
  @JSONField(name: "list")
  List<SearchTxtDataList> xList;
}

class SearchTxtDataList with JsonConvert<SearchTxtDataList> {
  String name;
  String category;

  Content getContent(){
    Content content = new Content();
    switch (category) {
      case "可回收垃圾":
        content.title = category;
        content.image="assets/images/search/recoverable_icon.png";
        content.content = "1.纸类收集请注意不要混入被污染过的纸类物品，避免揉团，应展开压平叠放。\n" +
            "2.投放的牛奶盒、果汁盒、酸奶盒等饮品包装盒建议展开后冲洗干净并压扁。\n" +
            "3.投放瓶罐类物品应尽可能将容器内产品用尽或倒尽，清理干净后投放。\n" +
            "4.玻璃类物品应小心轻放，以免割伤破损，最好是袋装或用容器装好后投放。\n" +
            "5.纺织类注意请勿混入脏污织物，建议叠放整齐并归类打包。";
        return content;
      case "有害垃圾":
        content.title = category;
        content.image="assets/images/search/test_harmful.png";
        content.content = "1. 分类投放有害垃圾时，应注意轻放（其中：废灯管等易破损的有害垃圾应该连包装或包裹后投放）。\n" +
            "2.废弃药品应连包装或包裏后一并投放。\n" +
            "3.杀虫剂等压力罐装容器，应排空内容物后投放。\n" +
            "4.玻璃类物品应小心轻放，以免割伤破损，最好是袋装或用容器装好后投放。\n" +
            "5.在公共场所产生有害垃圾且未发现对应收集容器时，应携带至有害垃圾投放点妥善投放。";
        return content;
      case "湿垃圾":
        content.title = category;
        content.image="assets/images/search/icon_rubbish_water.png";
        content.content = "1. 纯水质的厨余垃圾如牛奶等，可以倒入下水道。\n" +
            "2.有包装的厨余垃圾，投放时必须去掉包装。\n" +
            "3.厨余垃圾注意分类，吃不准是不是厨余垃圾的，可以网上垃圾分类查询后投放。\n" +
            "4.厨余垃圾投放后，注意将垃圾桶关上，以防虫蝇滋生。\n" +
            "5.每次投放厨余垃圾后，注意用流动水和肥皂洗手消毒。";
        return content;
      case "干垃圾":
        content.title = category;
        content.image="assets/images/home/other.png";
        content.content = "1. 干垃圾应投入干垃圾收集容器，并保持周边环境整洁。\n" +
            "2.成分复杂难以分辨类别的生活垃圾,投入干垃圾收集容器。\n";
        return content;
    };
    return content;
  }
}


