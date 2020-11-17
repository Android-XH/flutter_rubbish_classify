import 'package:color_dart/color_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/jsonEntry/search_content.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

import 'package:rubbishclassify/util/custom_appbar.dart';

class SearchDetail extends StatelessWidget {
  final SearchTxtDataList searchTxtData;
  final bool showAppbar;

  const SearchDetail({Key key, this.searchTxtData, this.showAppbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Content _content = searchTxtData.getContent();
    return Scaffold(
      appBar: customAppbar(context: context, title: searchTxtData.name),
      backgroundColor: rgba(255, 255, 255, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              _content.image,
              width: 65.0,
              height: 65.0,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                _content.title,
                style: TextStyle(
                    color: rgba(206, 203, 81, 1),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child:Divider(
                color: rgba(233, 233, 233, 1),
                height: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "${_content.title}投放指导",
                style: TextStyle(
                    color: rgba(51, 51, 51, 1),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              _content.content,
              strutStyle: StrutStyle(forceStrutHeight: true, height: 1.0, leading: 1.5),
              style: TextStyle(
                  color: rgba(102, 102, 102, 1),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
