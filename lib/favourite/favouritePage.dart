// ignore_for_file: unused_local_variable

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tourist_helper/models/fav_page_model.dart';
class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text( "Favourite Page"
     ),
      ),
      body: Container( 
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsets.all(8),
              child: _FavouritePageList(),
            ))
          ],
        ),
      ),

    );
  }
}

class _FavouritePageList extends StatelessWidget {
  const _FavouritePageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favouritepage=context.watch<FavouritePageModel>();

    return ListView.builder(
        itemCount: favouritepage.items.length,
        itemBuilder: (context , index)=>ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(favouritepage.items[index].Image),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){
              favouritepage.remove(favouritepage.items[index]);
            },

          ),
          title: Text(
            favouritepage.items[index].subtitle,
            style: TextStyle(fontSize: 16 , color: Colors.grey),
          ),

        ));
  }
}
