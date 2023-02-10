import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 57, 104),
        elevation: 0.0,
        title: Text(
          "${getLang(context, "aboutourApp")}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/questions.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(71, 0, 0, 0),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 59, 57, 57),
                        ),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                '${getLang(context, "text1")}',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                                speed: Duration(milliseconds: 150)),
                            TypewriterAnimatedText(
                              '${getLang(context, "text2")}',
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(
                                color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            TypewriterAnimatedText(
                              ' ${getLang(context, "text3")}',
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(
                                color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
