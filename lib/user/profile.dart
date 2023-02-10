import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);

  final email = FirebaseAuth.instance.currentUser!.email;
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children:[ 
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('images/background.jpg',fit: BoxFit.cover,),
            ),
            SingleChildScrollView(
              child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/person3.jfif"),
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${getLang(context, "username")}",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$email ",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).pushNamed("userinfo");
                  },
                  leading: Icon(Icons.account_circle),
                  title: Text("${getLang(context, "myAccount")} "),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed("fav");
                  },
                  leading: Icon(Icons.favorite),
                  title: Text("${getLang(context, "favourites")} "),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text("${getLang(context, "location")} "),
                ),
                Divider(),
                ListTile(
                  onTap: () {
          Navigator.of(context).pushNamed("settings");
                  },
                  leading: Icon(Icons.settings),
                  title: Text("${getLang(context, "settings")} "),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text("${getLang(context, "languages")}"),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                     Navigator.of(context).pushReplacementNamed("start");
                  },
                  leading: Icon(Icons.logout),
                  title: Text("${getLang(context, "logOut")} "),
                ),
              ],
                      ),
            ),
       ] ),
      ),
    );
  }
}
