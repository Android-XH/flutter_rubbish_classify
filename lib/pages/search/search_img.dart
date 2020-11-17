import 'package:color_dart/color_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/jsonEntry/img/img_entity.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';
import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/custom_appbar.dart';
import 'package:rubbishclassify/util/global.dart';

class SearchImg extends StatelessWidget {
  final ImgEntity imgEntity;

  const SearchImg({Key key, this.imgEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ImgData> _items = imgEntity.data;
    return Scaffold(
      appBar: customAppbar(
        context: context,
      ),
      backgroundColor: rgba(243, 243, 243, 1),
      body: ListView.builder(itemBuilder: (context, index) {
        ImgData _item = _items[index];
        return ExpansionTile(
          backgroundColor: rgba(255, 255, 255, 1),
          childrenPadding:EdgeInsets.only(bottom: 10.0),
            title:RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '${_item.keyword}',
                  style: TextStyle(
                      color: rgba(51, 51, 51, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: '（${_item.score * 100}%）',
                  style: TextStyle(
                      color: rgba(102, 102, 102, 1),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            initiallyExpanded:true,
            children: _content(_item.xList)
        );
      },itemCount: _items.length,),
    );
  }
  List<Widget> _content(List<SearchTxtDataList> xList) {
    List<Widget> list = [];
    if(xList==null){
      return list;
    }
    for (var _item in xList) {
      Widget w=FlatButton(
        onPressed: (){
          G.pushNamed(Router.search,arguments: _item);
        },
        child: Container(
          color: rgba(255,255,255,1),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: _item.name,
                style: TextStyle(
                  color: rgba(102, 102, 102, 1),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "（${_item.category}）",
                style: TextStyle(
                  color: rgba(153, 153, 153, 1),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
      );
      list.add(w);
    }
   return list;
  }
}
