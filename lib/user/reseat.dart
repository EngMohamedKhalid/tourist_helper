import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/component/loading.dart';

class ReseatPasswors extends StatefulWidget {
  ReseatPasswors({Key? key}) : super(key: key);

  @override
  State<ReseatPasswors> createState() => _ReseatPassworsState();
}

class _ReseatPassworsState extends State<ReseatPasswors> {
  final formkey = GlobalKey<FormState>();
   final emailcon = TextEditingController();
 @override
  void dispose() {
   emailcon.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
           Image.asset(
        "images/start.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formkey,
                child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25
                              , vertical: 15                       
                            ),
                            child: TextFormField(
                              controller: emailcon,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "${getLang(context, "email")}",
                                  fillColor: Color.fromARGB(255, 95, 88, 88),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 95, 88, 88),
                                    width: 2,
                                  )
                                  )
                                  ),
                            ),
                          ), 
                          ),
            
                        Container(
                          
                          decoration: BoxDecoration(
                             color: Color.fromARGB(255, 95, 88, 88),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          
                          child: TextButton(
                            style: ButtonStyle(
                            ),
                            onPressed: () async {
                              reseat();
                            }, 
                            child: Text("${getLang(context, "reseat")}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                            ),
                            )),
                        ),
                        ],
          ),
        ),
        ],
      ),
    );
    
  }
  reseat() async{
  showLoading;
   await FirebaseAuth.instance.sendPasswordResetEmail(
    email: emailcon.text.trim()

    );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            '${getLang(context, "verification")}',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );

  }

}