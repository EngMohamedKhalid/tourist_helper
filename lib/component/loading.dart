// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

showLoading(context){
  return showDialog(
    context: context,
     builder: (context){
      return AlertDialog(
       backgroundColor: Image.asset('images/start.jpg').color,
        title: Text("${getLang(context, "wait")}", 
        style: TextStyle(
          color:Color.fromARGB(255, 40, 36, 36), 
        ),
        ),
        content: Container(
          height: 50,
          child: Center(child: CircularProgressIndicator(
            color: Color.fromARGB(255, 43, 40, 40),
          ))),
      );
     },
     
     );
}