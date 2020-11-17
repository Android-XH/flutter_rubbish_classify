import 'dart:convert';

import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rubbishclassify/pages/search/delegate/search_bar_delegate.dart';
import 'package:rubbishclassify/pages/webview/webview.dart';

import 'package:rubbishclassify/routes/index.dart';
import 'package:rubbishclassify/util/global.dart';
import 'package:rubbishclassify/util/icon.dart';
import 'package:rubbishclassify/widgets/a_pick/a_pick_photo.dart';
import 'package:rubbishclassify/widgets/a_tag/a_tag.dart';
import 'package:rubbishclassify/widgets/search.dart';

class Home extends StatefulWidget {
  static _HomeState _homeState;

  Home() {
    if (_homeState == null) {
      _homeState = _HomeState();
    }
  }

  getAppBar() => _homeState.createAppBar();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _tagList;

  AppBar createAppBar() {
    /// 配置appbar
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tagList = [
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rgba(243, 243, 243, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Column(
          children: [
            Container(
              height: 30.0,
            ),
            _buildTitle(),
            _buildBanner(),
            _buildMenu(),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Image.asset("assets/images/home/answer.png"),
              ),
              onTap: () {
                WebData _webData=WebData();
                _webData.title="垃圾分类测试";
                _webData.url="https://www.wenjuan.in/s/eQZvqep/";
                G.pushNamed(Router.webView,arguments: _webData);
              },
            ),
            _buildButton(
                image: "assets/images/home/recoverable.png",
                color: rgba(30, 144, 255, 1),
                title: "可回收物",
                desc: "纸类、金属类、塑料、玻璃等",
                onPressed: () {
                  G.pushNamed(Router.rubbishDetail,arguments: "assets/images/detail/recyclable.png");
                }),
            _buildButton(
                image: "assets/images/home/test_harmful.png",
                color: rgba(208, 68, 75, 1),
                title: "有害垃圾",
                desc: "废电池、废日光灯管、废水银温度计、过期药品等",
                onPressed: () {
                  G.pushNamed(Router.rubbishDetail,arguments: "assets/images/detail/hazardous_waste.png");
                }),
            _buildButton(
                image: "assets/images/home/icon_rubbish_water.png",
                color: rgba(72, 169, 71, 1),
                title: "湿垃圾",
                desc: "剩菜剩饭、瓜皮、果核、菜叶碎骨、过期食品",
                onPressed: () {
                  G.pushNamed(Router.rubbishDetail,arguments: "assets/images/detail/water.png");
                }),
            _buildButton(
                image: "assets/images/home/other.png",
                color: rgba(206, 203, 81, 1),
                title: "干垃圾",
                desc: "餐盒、餐巾纸、湿纸巾、卫生间用纸、塑料袋、食品包装袋、污染严重的纸、烟蒂、纸尿裤、透明胶、花盆、陶瓷",
                onPressed: () {
                  G.pushNamed(Router.rubbishDetail,arguments: "assets/images/detail/dry_garbage.png");
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            "垃圾识别",
            style: TextStyle(
                color: rgba(51, 51, 51, 1),
                fontSize: 22.0,
                fontWeight: FontWeight.w800),
          ),
        ),
        FlatButton(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              iconLocation(size: 18),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  '杭州',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: rgba(51, 51, 51, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
          onPressed: () {
            G.toast("选择城市");
          },
        )
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(15.0),
        child: Image.asset(
          "assets/images/home/banner.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            ASearch(
              hint: "搜索垃圾",
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
              child: ATagLayout(
                data: _tagList,
                vSpacing: 8.0,
                onItemClick: (value){
                  SearchBarDelegate _search=SearchBarDelegate();
                  showSearch(context: context, delegate: _search);
                  _search.query=value;
                  _search.showResults(context);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildImgButton(
                    image: "assets/images/home/speech_recognition.png",
                    width: G.screenWidth()/5,
                    height:G.screenWidth()/5,
                    title: "语音识别",
                    icon: iconKeyBoardVoice(
                        size: 32, color: rgba(245, 245, 245, 1)),
                    onPressed: () {
                      G.pushNamed(Router.searchVoice);
//                      G.req.reqSearchVoice.searchRecoverWord(
//                          fileBase64: "");
                    }),
                _buildImgButton(
                    image: "assets/images/home/scanning_recognition.png",
                    width: G.screenWidth()/5,
                    height: G.screenWidth()/5,
                    title: "扫描搜索",
                    icon: iconPhotoCamera(
                        size: 32, color: rgba(245, 245, 245, 1)),
                    onPressed: () {
                      ImagePicker.pickImage(
                          source: ImageSource.camera, maxWidth: 800, maxHeight: 800)
                          .then((value)  async {
                            if(value!=null){
                              List bytes =await value.readAsBytes();
                              G.loading.show(context);
                              G.req.reqSearchImg.searchRecover(Uri.encodeComponent(base64Encode(bytes))).then((value) {
                                G.loading.hide(context);
                                G.pushNamed(Router.searchImg,arguments: value);
                              }).catchError((e){
                                G.loading.hide(context);
                              });
                            }
                      });
                    }),
                _buildImgButton(
                    image: "assets/images/home/photo_search.png",
                    width: G.screenWidth()/5,
                    height: G.screenWidth()/5,
                    title: "图片识别",
                    icon: iconPhoto(size: 32, color: rgba(245, 245, 245, 1)),
                    onPressed: () {
                      PickPhotoView.show(context,(value){
                        G.loading.show(context);
                        G.req.reqSearchImg.searchRecover(value).then((value) {
                          G.loading.hide(context);
                          G.pushNamed(Router.searchImg,arguments: value);
                        }).catchError((e){
                          G.loading.hide(context);
                        });
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImgButton(
      {String image,
      double width,
      double height,
      String title,
      Icon icon,
      VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Image.asset(
            image,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Container(
                  margin: EdgeInsets.only(top: 3.0),
                  child: Text(
                    title ?? "",
                    style: TextStyle(
                        color: rgba(245, 245, 245, 1),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton(
      {String image,
      Color color,
      String title,
      String desc,
      VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: rgba(255, 255, 255, 1),
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                width: 45.0,
                height: 45.0,
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      style: TextStyle(
                          color: rgba(245, 245, 245, 1),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        desc ?? "",
                        style: TextStyle(
                            color: rgba(245, 245, 245, 1),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
