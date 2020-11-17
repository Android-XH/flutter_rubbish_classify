
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String _fontFamily="iconfont";

IconData _getData(int codePoint){
  return IconData(codePoint,fontFamily: _fontFamily);
}

Icon iconHome({Color color,double size=18}){
  return Icon(
    _getData(0xe6bb),
    size: size,
    color: color,
  );
}
Icon iconMarket({Color color,double size=18}){
  return Icon(
    _getData(0xe616),
    size: size,
    color: color,
  );
}
Icon iconMine({Color color,double size=18}){
  return Icon(
    _getData(0xe600),
    size: size,
    color: color,
  );
}
Icon iconLocation({Color color,double size=18}){
  return Icon(
      _getData(0xe71f),
      size: size,
      color: color
  );
}
Icon iconSearch({Color color,double size=18}){
  return Icon(
    Icons.search,
    color: color,
    size: size,
  );
}
Icon iconBoardArrowDown({Color color,double size=18}){
  return Icon(
      Icons.keyboard_arrow_down,
      size: size,
      color: color
  );
}
Icon iconKeyBoardVoice({Color color,double size=18}){
  return Icon(
      Icons.keyboard_voice,
      size: size,
      color: color
  );
}
Icon iconPhotoCamera({Color color,double size=18}){
  return Icon(
      Icons.photo_camera,
      size: size,
      color: color
  );
}
Icon iconPhoto({Color color,double size=18}){
  return Icon(
      Icons.photo,
      size: size,
      color: color
  );
}
Icon iconBack({Color color,double size=18}){
  return Icon(
      Icons.arrow_back,
      size: size,
      color: color
  );
}
Icon iconArrowRight({Color color,double size=18}){
  return Icon(
      Icons.keyboard_arrow_right,
      size: size,
      color: color
  );
}