import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../localization/appLocal.dart';

class UserInformation extends StatefulWidget {
  UserInformation({Key? key}) : super(key: key);

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
   final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            SizedBox(height: 30,),
              Container(
                
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
      
                ),
      
                child: 
                Row(
                  children:  [
                  Expanded(
                      child: Text("${getLang(context, "Info")} :- ",
                                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
                                      ),
                    ),
                    //SizedBox(width: 319,),
                    Icon(Icons.mobile_friendly),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 510,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
      
                ),
      
      
                child: Column(
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children:[ CircleAvatar(
                         backgroundImage:AssetImage("images/Profile.jpg") 
                         ,radius: 50,),
                      ]),
                
                
                    ),
                
                    ListTile(
                      title: Text("${getLang(context, "name")} :- "),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${getLang(context, "e-mail")}:- $email "),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${getLang(context, "homeLand")} :-  "),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${getLang(context, "phoneNum")} :-"),
                    ),
                    Divider(),
                  ListTile(
                      title: Text("${getLang(context , "face")} :-") ,
                    ),
                  ],
                
                ),
              ),
      
           SizedBox(height: 40,),
           Container(
             width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
               color: Colors.black12,
               borderRadius: BorderRadius.circular(20),
      
             ),
      
             child: InkWell(
               onTap: (){
                 Navigator.pop(context);
               },
               child: Row(
      
                 children: [
                   Icon(Icons.arrow_back),
                   SizedBox(width:150 ,),
                   Text("${getLang(context, "back")}",
                   style: TextStyle(fontSize: 25),),
      
                 ],
               ),
             ),
           ),
      
            ],
      
          ),
        ),
      ),

    );
  }
}