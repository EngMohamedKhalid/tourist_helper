import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 0, 57, 104),
        title: Text("${getLang(context, "developers")}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/team.png'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${getLang(context, "maintext")}",
                style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Colors.white70,
              elevation: 5.0,
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 25,
                child: Text(
                  "${getLang(context, "mohamed")}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 25,
                child: Text(
                  "${getLang(context, "mahmoud")}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 25,
                child: Text(
                  "${getLang(context, "walaa")}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 25,
                child: Text(
                  "${getLang(context, "nada")}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 25,
                child: Text(
                  "${getLang(context, "fatma")}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
