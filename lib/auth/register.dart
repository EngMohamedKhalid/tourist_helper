// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/component/loading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  var username, password, email;
  late UserCredential userCredential;
  Future signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog(
            dialogBackgroundColor: Color.fromARGB(255, 225, 217, 217),
            buttonsTextStyle: TextStyle(color: Color.fromARGB(255, 96, 78, 78)),
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            title: '${getLang(context, "hint")}',
            desc: '${getLang(context, "weekPass")}',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          // ignore: avoid_single_cascade_in_expression_statements
          AwesomeDialog( 
            
            dialogBackgroundColor: Color.fromARGB(255, 225, 217, 217),
            buttonsTextStyle: TextStyle(color: Color.fromARGB(255, 96, 78, 78)),
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            title: '${getLang(context, "hint")}',
            desc: '${getLang(context, "usedEmail")}',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      } catch (e) {
        print(e);
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
                          "${getLang(context, "haveAccount")}",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "${getLang(context, "please")}",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "${getLang(context, "log")}",
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
                          "${getLang(context, "sign")}",
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
                          Navigator.of(context).pushReplacementNamed("login");
                        },
                        child: Text(
                          "${getLang(context, "log")}",
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
                        username = val;
                      },
                      validator: (val) {
                        if (val!.length < 3) {
                          return "${getLang(context, "Name")}";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "${getLang(context, "username")}",
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
                        email = val;
                      },
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
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Color.fromARGB(80, 1, 4, 22),
                    child: MaterialButton(
                        splashColor: Colors.white,
                        onPressed: () async {
                          UserCredential? response = await signUp();
                          if (response != null) {
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
