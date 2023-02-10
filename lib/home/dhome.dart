

// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/localization/lang.dart';
import 'package:tourist_helper/main.dart';
import 'package:tourist_helper/theme/manager.dart';
import 'package:tourist_helper/widgets/about.dart';
import 'package:tourist_helper/widgets/developers.dart';
import 'package:tourist_helper/widgets/more.dart';
import 'package:tourist_helper/user/profile.dart';
import 'package:tourist_helper/user/settings.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
bool isdark = false;
int rating = 0;
int selectedItem = 0;
final email = FirebaseAuth.instance.currentUser!.email;
final photo = FirebaseAuth.instance.currentUser!.photoURL;

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
     // backgroundColor: Colors.white,
      // AppBar here
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            key.currentState!.openDrawer();
          },
         icon: Icon(Icons.menu , 
         ),
         ),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            Text(
              '${getLang(context, "currentLocation")}',
             
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            // ignore: sized_box_for_whitespace
            child: GestureDetector(
              onTap: (() {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => Profile()));
              }),
              // ignore: sized_box_for_whitespace
              child: Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('images/person3.jfif'),
                  )),
            ),
          ),
        ],
      ),
      //Add drawer here with white color....!!
      drawer: Drawer(
          child: ListView(
            children: [
        GestureDetector(
          onTap: (() {
             Navigator.of(context).pushNamed("profile");
          }),
          child: UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              //////////////////////////////////////////////////////////
                backgroundImage: NetworkImage('$photo')),
                /////////////////////////////////////////
            accountName: Text('User Name'),
            accountEmail: Text('$email'),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 57, 104),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                  ),
                ]),
          ),
        ),
        ListTile(
          selected: selectedItem == 0 ? true : false,
          //selectedColor: Color.fromARGB(255, 0, 57, 104),
          leading: Icon(Icons.account_circle),
          title: Text('${getLang(context, "profile")}'),
          onTap: () {
            setState(() {
              selectedItem = 0;
            });
              Navigator.of(context).pushNamed("profile");
          },
        ),
        ListTile(
          selected: selectedItem == 1 ? true : false,
          //selectedColor: Color.fromARGB(255, 0, 57, 104),
          leading: Icon(Icons.settings),
          title: Text('${getLang(context, "settings")}'),
          onTap: () {
            setState(() {
              selectedItem = 1;
            });
           Navigator.push((context),
                MaterialPageRoute(builder: (context) => SettingScreen())
                );
          },
        ),
        ListTile(
          selected: selectedItem == 2 ? true : false,
         // selectedColor: Color.fromARGB(255, 0, 57, 104),
          leading: Icon(Icons.info),
          title: Text('${getLang(context, "aboutApp")}'),
          onTap: () {
            setState(() {
              selectedItem = 2;
            });
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => AboutAppScreen()));
          },
        ),
        ListTile(
          selected: selectedItem == 3 ? true : false,
          //selectedColor: Color.fromARGB(255, 0, 57, 104),
          leading: Icon(Icons.groups),
          title: Text('${getLang(context, "aboutDevelopers")}'),
          onTap: () {
            setState(() {
              selectedItem = 3;
            });
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => DeveloperScreen())
                );
          },
        ),
        ListTile(
          trailing: Switch(
            activeColor: Colors.blue,
            value: themeManager.themeMode == ThemeMode.dark, 
            onChanged: (newValue) {
           setState(() {
              themeManager.toggleTheme(newValue);
           });
        }),
          selected: selectedItem == 4 ? true : false,
          //selectedColor: Color.fromARGB(255, 0, 57, 104),
          leading: Icon(Icons.dark_mode),
          title: Text('${getLang(context, "darkMode")}'),
          onTap: () {
            setState(() {
              selectedItem = 4;
            });
           },
        ),
        ListTile(
          trailing: DropdownButton(
            underline: SizedBox(),
            icon: Icon(Icons.arrow_drop_down,
            size: 30,
            ),
            items: Language.langList().
            map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
              value: lang,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Text(lang.flag),
                 Text(lang.name)
              ],
              )
              )
              ).toList()
               ,onChanged: (Language? lang){
                _changeLang(lang);
               },
          ),
          selected: selectedItem == 5 ? true : false,
          leading: Icon(Icons.language),
          title: Text('${getLang(context, "languages")}'),
          onTap: () {
            setState(() {
              selectedItem = 5;
            });
          },
        )
      ,
      ]
      )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              text('${getLang(context, "category")}'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    category('images/mountain.png',
                     '${getLang(context, "mountain")}'
                     ),
                    SizedBox(
                      width: 10.0,
                    ),
                    category('images/beach.png', '${getLang(context, "beach")}'),
                    SizedBox(
                      width: 10.0,
                    ),
                    category('images/park.png', '${getLang(context, "park")}'),
                    SizedBox(
                      width: 10.0,
                    ),
                    category('images/camp.png', '${getLang(context, "camp")}'),
                  ],
                ),
              ),
              text('${getLang(context, "recommendedforyou")}'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      recommended(
                          '${getLang(context, "costaParadiso")}', 'images/costa.jpg','${getLang(context, "viaLiBudi")}'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recommended('${getLang(context, "kefaloniaIsland")}', 'images/kefalonia.jpg', '${getLang(context, "california")}'),
                      SizedBox(
                        width: 10.0,
                      ),
                      recommended('${getLang(context, "ubudBali")}',  'images/bali.jpg', '${getLang(context, "bali")}'),
                    ],
                  ),
                ),
              ),
              text('${getLang(context, "exploreMore")}'),
              SizedBox(
                height: 8.0,
              ),
              MoreScreen(),
            ],
          ),
        ),
      ),
    );
  }
  
  void _changeLang(Language? lang) {
    Locale _temp ;
    switch (lang!.languageCode){
      case "en":
         _temp =Locale(lang.languageCode , "🇺🇸");
         break;
      case "ar":
         _temp =Locale(lang.languageCode , "🇪🇬"); 
         break;

         default:
            _temp =Locale("en" , "🇺🇸");
       }
      return MyApp.setLocale(context, _temp);

  }
}

// Widget for text
Widget text(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Expanded(
            child: Text(
          txt,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
        ),
        Text(
          'See All',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}

// Widget for category design
Widget category(String img, String text) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(255, 0, 57, 104),
        ),
        child: Image.asset(img),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ],
  );
}

//  Widget for recommended
Widget recommended(String text, String img1, String txt) {
  return Stack(
    children: [
      Container(
        width: 200,
        height: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 126, 124, 124), blurRadius: 5.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  img1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 57, 104),
                fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                Text(
                  txt,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}
