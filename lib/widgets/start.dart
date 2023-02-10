import 'package:flutter/material.dart';
import 'package:tourist_helper/auth/login.dart';
import 'package:tourist_helper/auth/register.dart';
import 'package:tourist_helper/localization/appLocal.dart';


class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset('images/start.jpg').color,
      body: Container(
        child: Stack(children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/start.jpg',
                    ),
                    fit: BoxFit.cover)
                    ),
          )
          ),
          Image.asset(
            'images/logo2.png',
            width: 100,
            height: 100,
          ),
          Positioned(
              bottom: 0.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Container(
                  height: 250,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(24, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${getLang(context, "explore")}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${getLang(context, "best")}',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Text(
                        "${getLang(context, "passengers")}",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text('${getLang(context, "create")}',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text('${getLang(context, "already")}',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              )
              )
        ]),
      ),
    );
  }
}
