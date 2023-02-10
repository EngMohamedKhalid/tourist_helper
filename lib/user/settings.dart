import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("${getLang(context, "settings")}"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiB88zjt7Xh0zNX6WIi_LBVjklAhUBzhRZtg&usqp=CAU"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Text(
                    '${getLang(context, "userName")}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 240,
                  ),
                  const Icon(Icons.mode_edit)
                ]),
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 30,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.purple,
                              child: Icon(
                                Icons.privacy_tip,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "   ${getLang(context, "privacy")}",
                              style: TextStyle(fontSize: 18),
                            ),
                            //  SizedBox(
                            //    width: MediaQuery.of(context).size.width - 240,
                            // ),
                            //SizedBox( width: 200,),
                            Icon(Icons.chevron_right,
                                size: 25, color: Colors.black54),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.switch_account_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          Text(
                              "${getLang(context, "switchAccount")}",
                              style: TextStyle(fontSize: 18),
                            ),
                            // SizedBox( width: 150,),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width - 440,
                            // ),
                            Icon(Icons.chevron_right,
                                size: 25, color: Colors.black54),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.pink,
                              child: Icon(
                                Icons.report_problem,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " ${getLang(context, "reportAProblem")}",
                              style: TextStyle(fontSize: 18),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width - 240,
                            // ),
                            Icon(Icons.chevron_right,
                                size: 25, color: Colors.black54),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(
                                Icons.help,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${getLang(context, "help")}",
                              style: TextStyle(fontSize: 18),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width - 240,
                            // ),
                            Icon(Icons.chevron_right,
                                size: 25, color: Colors.black54),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.local_police_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${getLang(context, "legalAndPolicies")}",
                              style: TextStyle(fontSize: 18),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width - 240,
                            // ),
                            Icon(Icons.chevron_right,
                                size: 25, color: Colors.black54),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
