import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
import 'package:tourist_helper/widgets/rating.dart';


class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 126, 124, 124), blurRadius: 5.0)
              ]),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/niagara.jpg',
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  '${getLang(context, "niagaraWaterfall")}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 57, 104),
                      fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      Text('${getLang(context, "canada")}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ],
                  ),
                  Rating((rating) {
                    setState(() {
                      rating = rating;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0,),
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 126, 124, 124), blurRadius: 5.0)
              ]),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/roma.jpg',
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${getLang(context, "roma")}',
                    style: TextStyle(
                    color: Color.fromARGB(255, 0, 57, 104),
                       fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      Text('${getLang(context, "italia")}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ],
                  ),
                  Rating((rating) {
                    setState(() {
                      rating = rating;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
          SizedBox(height: 8.0,),
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 126, 124, 124), blurRadius: 5.0)
              ]),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/Malaysia.jpg',
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${getLang(context, "malaysia")}',
                    style: TextStyle(
                     color: Color.fromARGB(255, 0, 57, 104),
                      fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      Text('${getLang(context, "southeastAsia")} ',
                     style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ],
                  ),
                  Rating((rating) {
                    setState(() {
                      rating = rating;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
