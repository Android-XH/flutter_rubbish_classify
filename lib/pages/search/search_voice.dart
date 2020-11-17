import 'dart:convert';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rubbishclassify/util/custom_appbar.dart';
import 'package:rubbishclassify/util/global.dart';

import 'package:rubbishclassify/widgets/a_voice/a_voice_widget.dart';

class SearchVoice extends StatefulWidget {
  @override
  _SearchVoiceState createState() => _SearchVoiceState();
}

class _SearchVoiceState extends State<SearchVoice> {
  String _voiceMsg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context),
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                _voiceMsg ?? "",
                style: TextStyle(
                    color: rgba(51, 51, 51, 1),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Container(
              width: 80.0,
              height: 80.0,
              child: VoiceWidget(
                  startRecord: () {},
                  stopRecord: (file, length) async {
                    List bytes = await file.readAsBytes();
                    G.req.reqSearchVoice.searchRecoverWord(
                        fileBase64: base64Encode(bytes));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
