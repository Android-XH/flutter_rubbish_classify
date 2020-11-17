import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rubbishclassify/util/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebData{
  String title;
  String url;
}

// ignore: must_be_immutable
class FlutterWebView extends StatefulWidget {
  WebData webData;

  FlutterWebView({this.webData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState(webData);
  }
}

class _WebViewState extends State<FlutterWebView>
    with AutomaticKeepAliveClientMixin {
  WebData _webData;
  String _webUrl;
  _WebViewState(this._webData);

  @override
  void initState() {
    super.initState();
    _webUrl = Uri.decodeComponent(_webData.url);
  }

  final Completer<WebViewController> _controller =Completer<WebViewController>();
  bool _loading = true; //等待
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(
          title: _webData.title,
          context: context,
        ),
        body: SafeArea(
          //设置安全区域 ，不沉浸式
          top: true,
          child: Builder(builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                _showWebView(context),
                Visibility(
                  child:Center(
                    child: CircularProgressIndicator(),
                  ) ,
                  visible: _loading,
                )
              ],
            );
          }),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ///初始化webview显示
  Widget _showWebView(BuildContext context) {
    WebView webView= WebView(
      initialUrl: _webUrl,
      ///初始化url
      javascriptMode: JavascriptMode.unrestricted,
      ///JS执行模式
      onWebViewCreated: (WebViewController webViewController) {
        ///在WebView创建完成后调用，只会被调用一次
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        //路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
        ///通过拦截url来实现js与flutter交互
        if (request.url.startsWith('js://webview')) {
          return NavigationDecision.prevent;
          ///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
        }
        return NavigationDecision.navigate;
        ///允许路由替换
      },
      onPageFinished: (String url) {
        ///页面加载完成回调
        setState(() {
          _loading = false;
        });
        print('Page finished loading: $url');
      },
    );
    return webView;
  }
}
