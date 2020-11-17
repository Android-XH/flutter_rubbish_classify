import 'dart:convert';


import 'package:color_dart/rgba_color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rubbishclassify/util/global.dart';


class PickPhotoView {
  final BuildContext context;
  final ValueChanged valueChanged;
  PickPhotoView.show(this.context, this.valueChanged) {
    showCupertinoModalPopup(
        context: context,
        builder: (cxt) {
          return Container(
            height: 162.0,
            width: double.maxFinite,
            color: rgba(255, 255, 255, 1),
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Container(
                    height: 50.0,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      '拍  照',
                      style: TextStyle(
                          color: rgba(51, 51, 51, 1),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: () {
                    _requestPermissions(ImageSource.camera);
                    Navigator.pop(cxt);
                  },
                ),
                Divider(
                  color: rgba(102, 102, 102, 1.5),
                  height: 1.0,
                ),
                FlatButton(
                  child: Container(
                    height: 50.0,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      '从手机相册选择',
                      style: TextStyle(
                          color: rgba(51, 51, 51, 1),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: () {
                    _requestPermissions(ImageSource.gallery);
                    Navigator.pop(cxt);
                  },
                ),
                Container(
                  color: rgba(0, 0, 0, 1),
                  height: 8.0,
                ),
                FlatButton(
                  child: Container(
                    height: 50.0,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      '取  消',
                      style: TextStyle(
                          color: rgba(153, 153, 153, 1),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(cxt);
                  },
                ),
              ],
            ),
          );
        });
  }
  // ignore: missing_return
  Future<bool> _requestPermissions(ImageSource imageSource) async {
    //  申请权限
    await Permission.camera.request();
    //  申请结果
    PermissionStatus permissionStatus = await Permission.camera.status;
    if (permissionStatus == PermissionStatus.granted) {
      ImagePicker.pickImage(source: imageSource, maxWidth: 800, maxHeight: 800)
          .then((value) async {
        List bytes =await value.readAsBytes();
        _searchImg(Uri.encodeComponent(base64Encode(bytes)));
      });
    } else {
      print('申请被拒绝');
      bool isShow = await Permission.camera.shouldShowRequestRationale;
      if (!isShow) {
        G.errToast('当前权限已被禁用申请，请在设置中手动开启后退出重新进入程序');
        await openAppSettings();
      } else {
        PermissionStatus ps = await Permission.camera.status;
        if (ps == PermissionStatus.granted) {
          ImagePicker.pickImage(
              source: imageSource, maxWidth: 800, maxHeight: 800)
              .then((value)  async {
            List bytes =await value.readAsBytes();
            _searchImg(Uri.encodeComponent(base64Encode(bytes)));
          });
        } else {
          _requestPermissions(imageSource);
        }
      }
    }
  }
  void _searchImg(String base64){
    valueChanged.call(base64);
  }
}
