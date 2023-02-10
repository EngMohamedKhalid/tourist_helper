import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${getLang(context, "face")}"),
      ),
    );
  }
}