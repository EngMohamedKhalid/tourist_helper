import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/home/dhome.dart';
import 'package:tourist_helper/widgets/explore.dart';
import 'package:tourist_helper/user/fav.dart';
import 'package:tourist_helper/user/profile.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomShow = false;
  IconData fanIcon = Icons.edit;
  var textControll = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: screens[y],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(181, 0, 57, 104),
          onPressed: () {
            // make bottom show
            if (isBottomShow) {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context);
                isBottomShow = false;
                setState(() {
                  fanIcon = Icons.search;
                });
              }
            } else {
              scaffoldKey.currentState?.showBottomSheet(
                (context) => Container(
                  color: Color.fromARGB(0, 158, 158, 158),
                  child: Form(
                      key: formKey,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '${getLang(context, "searchHere")}',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            controller: textControll,
                             keyboardType: TextInputType.text,
                          ),
                        ),
                      ])),
                ),
              );
              isBottomShow = true;
              setState(() {
                fanIcon = Icons.send;
              });
            }
          },
          child: Icon(fanIcon),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          
            shape: CircularNotchedRectangle(),
            elevation: 0.0,
            notchMargin: 12,
            child: BottomNavigationBar(
              backgroundColor: Color.fromARGB(0, 0, 57, 104),
              currentIndex: y,
              onTap: (x) {
                setState(() {
                  y = x;
                });
              },
              type: BottomNavigationBarType.fixed,
              fixedColor: Color.fromARGB(255, 0, 57, 104),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "${getLang(context, "home")}",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore,
                  ),
                  label: "${getLang(context, "explore")}",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "${getLang(context, "favourites")}",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  label: "${getLang(context, "profile")}",
                ),
              ],
            )));
  }

  List<Widget> screens = [
    HomeScreen(),
    Explore(),
    Favourite(),
    Profile(),
  ];
}
