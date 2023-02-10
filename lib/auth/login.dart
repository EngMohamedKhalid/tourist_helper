// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/component/loading.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  // ignore: prefer_typing_uninitialized_variables
  var email, password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late UserCredential userCredential;
  Future LogIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            dialogBackgroundColor: Color.fromARGB(255, 225, 217, 217),
            buttonsTextStyle: TextStyle(color: Color.fromARGB(255, 96, 78, 78)),
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.LEFTSLIDE,
            title: '${getLang(context, "hint")}',
            desc: '${getLang(context, "NoUser")}',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            dialogBackgroundColor:  Color.fromARGB(255, 225, 217, 217),
            buttonsTextStyle: TextStyle(color: Color.fromARGB(255, 96, 78, 78)),
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            title: '${getLang(context, "hint")}',
            desc: '${getLang(context, "WrongPass")}',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
         Image.asset(
          "images/start.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(24, 255, 255, 255),
          ),
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 59, 57, 57),
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          "${getLang(context, "NoAccount")}",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "${getLang(context, "please")}",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          " ${getLang(context, "sign")}",
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${getLang(context, "log")}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("register");
                        },
                        child: Text(
                          "${getLang(context, "sign")}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 78, 74, 74)),
                        ),
                      ),
                     ],
                   ),
                  
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      onSaved: (val) {
                        email = val;
                      },
                      //  validator: (val) {
                      //   if(val!.length <14 ){
                      //    return"No user found for that email";
                      //    }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "${getLang(context, "emailId")}",
                          fillColor: Color.fromARGB(255, 95, 88, 88),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 95, 88, 88),
                            width: 2,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      onSaved: (val) {
                        password = val;
                      },
                      obscureText: isPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            icon: Icon(isPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "${getLang(context, "pass")}",
                          fillColor: Color.fromARGB(255, 95, 88, 88),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 95, 88, 88),
                            width: 2,
                          ))),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("reseat");
                    },
                    child: Text("${getLang(context, "forgotpass")}",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 17.5,
                       color: Color.fromARGB(255, 59, 57, 57),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Color.fromARGB(80, 1, 4, 22),
                    child: MaterialButton(
                        splashColor: Colors.white,
                        onPressed: () async {
                          UserCredential? user = await LogIn();
                          if (user != null) {
                              Navigator.of(context)
                              .pushReplacementNamed("nav");
                          } else {}
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
