// ignore_for_file: unused_element, unused_import

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_helper/auth/login.dart';
import 'package:tourist_helper/auth/register.dart';
import 'package:tourist_helper/favourite/favorite_list.dart';
import 'package:tourist_helper/favourite/favouritePage.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/home/dhome.dart';
import 'package:tourist_helper/test.dart';
import 'package:tourist_helper/theme/constant.dart';
import 'package:tourist_helper/theme/manager.dart';
import 'package:tourist_helper/user/reseat.dart';
import 'package:tourist_helper/user/userInfo.dart';
import 'package:tourist_helper/user/fav.dart';
import 'package:tourist_helper/widgets/about.dart';
import 'package:tourist_helper/widgets/developers.dart';
import 'package:tourist_helper/widgets/nav.dart';
import 'package:tourist_helper/user/profile.dart';
import 'package:tourist_helper/user/settings.dart';
import 'package:tourist_helper/widgets/start.dart';
bool? islogin;
bool isdark = false;
SharedPreferences? mySharedPreferences;
ThemeManager themeManager = ThemeManager();
Future<void> main(List<String> args) async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   var user = FirebaseAuth.instance.currentUser;
    mySharedPreferences = await SharedPreferences.getInstance();
 if(user == null){
  islogin = false;
 }else{
  islogin = true;
 }
   runApp(  MyApp()
//  MaterialApp(
//     theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: themeManager.themeMode,
//   home: //StartScreen(),
//       islogin == false? StartScreen(): NavigatorScreen(),
//       debugShowCheckedModeBanner: false,
//       routes: {
//        "register": (context)=>RegisterScreen(),
//        "login": (context)=>LoginScreen(),
//        "home":(context) => HomeScreen(),
//        "developer":(context) => DeveloperScreen(),
//        "about":(context) => AboutAppScreen(),
//        "settings" :(context) => SettingScreen(),
//        "nav":(context) => NavigatorScreen(),
//        "profile":(context) => Profile()


  
//     },
//     )
   );
   
}



class MyApp extends StatefulWidget {
  // This widget is the root of your application.
static void setLocale(BuildContext context , Locale locale){
  _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  state!.setLocal(locale);
}

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale ;

  void setLocal(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
  home: //FavouriteList(),
     islogin == false? StartScreen(): NavigatorScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
       "register": (context)=>RegisterScreen(),
       "login": (context)=>LoginScreen(),
       "home":(context) => HomeScreen(),
       "developer":(context) => DeveloperScreen(),
       "about":(context) => AboutAppScreen(),
       "settings" :(context) => SettingScreen(),
       "nav":(context) => NavigatorScreen(),
       "profile":(context) => Profile(),
       "userinfo":(context) => UserInformation(),
       "reseat" :(context) => ReseatPasswors(),
       "start" :(context) => StartScreen(),
      "fav" :(context) => Favourite()

   
    },
    locale: _locale,
    localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate 
        ],
        supportedLocales: [
          Locale("en", "🇺🇸"),
          Locale("ar", "🇪🇬"),
        ],
        
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                mySharedPreferences!.setString("lang",currentLang.languageCode) ; 
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
    );
  }
}