import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/favourite/favorite_list.dart';
import 'package:tourist_helper/favourite/favouritePage.dart';
import 'package:tourist_helper/models/fav_list_Model.dart';
import 'package:tourist_helper/models/fav_page_model.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      Provider(create: (context)=>FavouriteListModel()),
      ChangeNotifierProxyProvider<FavouriteListModel,FavouritePageModel>(
        create:(context)=>FavouritePageModel(),
          update: (context,favouritelist,favouritepage){
          if(favouritepage==null)
            throw ArgumentError.notNull('favouritepage');
          favouritepage.favouritelist=favouritelist;
          return favouritepage;
          }),
    ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/' :(context) =>  FavouriteList(),
          '/favouritepage': (context) => FavouritePage(),
        },
      ),




     );
  }
}
