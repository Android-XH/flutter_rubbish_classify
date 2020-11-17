import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/jsonEntry/txt/search_txt_entity.dart';

import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/global.dart';
import 'package:rubbishclassify/util/log_util.dart';
import 'package:rubbishclassify/widgets/a_tag/a_tag.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  String searchKey;

  static SearchBarDelegate create({String searchKey}){
    SearchBarDelegate searchBarDelegate=SearchBarDelegate();
    searchBarDelegate.query=searchKey;
    return searchBarDelegate;
  }

  // 搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。 当点击图片时，清空搜索的内容。
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // 清空搜索内容
          query = "";
          buildSuggestions(context);
        },
      )
    ];
  }

  // 搜索栏左侧的图标和功能，点击时关闭整个搜索页面
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          color: rgba(102, 102, 102, 1),
          progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

// 添加了网络请求模拟方法
  Future<List<SearchTxtDataList>> _requestData(
      String queryContent, BuildContext context) async {
    return await Future.delayed(Duration.zero, () {
      return G.req.reqSearchTxt.searchRecoverWord(query).then((value) {
        return value.xList;
      });
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    LogUtil.e("搜索：$query");
    return FutureBuilder(
        future: _requestData(query, context),
        builder: (context, snapshot) {
          LogUtil.e("触发状态${snapshot.connectionState}");
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              LogUtil.e("没有触发。。。");
              return new Container();
            // 当前没有连接到任何的异步任务
            case ConnectionState.waiting:
            // 连接到异步任务并等待进行交互
            case ConnectionState.active:
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black54,
                  ),
                  width: 120,
                  height: 120,
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: CupertinoActivityIndicator(
                      radius: 14,
                    ),
                  ),
                ),
              );
            // 连接到异步任务并开始交互
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text(
                      "加载数据失败",
                      style: TextStyle(
                          color: rgba(102, 102, 102, 1),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List _dataList=snapshot.data;
                return   ListView.separated(
                    itemBuilder: (context, index) {
                      SearchTxtDataList _item = _dataList[index];
                      return GestureDetector(
                        onTap: (){
                          G.pushNamed(Router.search,arguments: _item);
                        },
                        child: Container(
                          color: rgba(255,255,255,1),
                          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: _item.name,
                                style: TextStyle(
                                  color: rgba(51, 51, 51, 1),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "（${_item.category}）",
                                style: TextStyle(
                                  color: rgba(102, 102, 102, 1),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: rgba(235, 235, 235, 1),
                        height: 1,
                      );
                    },
                    itemCount: _dataList.length);
              }
          }
          return Container();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 15.0),
            child: Text(
              '大家都在搜',
              style: TextStyle(
                  color: rgba(51, 51, 51, 1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
          ATagLayout(
            data: recentList,
            onItemClick: (v) {
              query = v;
              showResults(context);
            },
          )
        ],
      ),
    );
  }
}

const recentList = [
  "快递包装袋",
  "玻璃杯",
  "快递盒子",
  "电池",
  "香蕉皮",
  "外卖塑料盒",
  "核桃壳",
  "烟盒",
  "饮料瓶"
];
