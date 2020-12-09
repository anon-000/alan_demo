import 'package:alan_voice/alan_voice.dart';
import 'package:anon/pages/new_page/new_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created By AURO (aurosmruti@smarttersstudio.com) on 12/7/2020 1:11 PM
///

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _alanSdkKey = 'your sdk key here';
  Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    initAlan();
  }

  initAlan() {
    AlanVoice.addButton(_alanSdkKey);
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }

  _handleCommand(Map<String, dynamic> response) {
    switch (response["command"]) {
      case "next_page":
        Get.to(NewPage());
        break;
      case "prev_page":
        Get.back();
        break;
      case "change_bg_color":
        setState(() {
          bgColor = Colors.yellow;
        });
        break;
      case "disable":
        AlanVoice.deactivate();
        break;
      default:
        print("no match found");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
    );
  }
}
