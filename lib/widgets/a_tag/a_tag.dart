import 'package:color_dart/rgba_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ATagLayout extends StatelessWidget {
  final List data;
  final double hSpacing;
  final double vSpacing;
  final ValueChanged<String> onItemClick;
  const ATagLayout({Key key, this.data, this.hSpacing, this.vSpacing, this.onItemClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: hSpacing??8.0, // 主轴(水平)方向间距
      runSpacing: vSpacing??4.0, //纵轴（垂直）方向间距
      children: tag(),
    );
  }
  List<Widget> tag() {
    var textColors=[rgba(57, 110, 245, 1),rgba(255, 133, 81, 1),rgba(255, 149, 0, 1),rgba(3, 164, 255, 1),];
    var tagColors=[rgba(238, 244, 255, 1), rgba(255, 241, 235, 1),rgba(255, 243, 226, 1), rgba(224, 244, 255, 1),];
    List<Widget> list = [];
    if(data==null){
      return list;
    }
    for(int i=0;i<data.length;i++){
      Widget w=RawMaterialButton(
        fillColor: tagColors[i%tagColors.length],
        elevation:0,
        highlightElevation: 0,
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        constraints: const BoxConstraints(minHeight: 25.0),
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
        onPressed: (){
          if(onItemClick!=null){
            onItemClick.call(data[i]);
          }
        },
        child: Text(data[i],textAlign: TextAlign.center,
          style:TextStyle(
              fontSize: 12,
              color: textColors[i%textColors.length],
              fontWeight: FontWeight.w500),
        ),
      );
      list.add(w);
    }
    return list;
  }
}
