import 'package:flutter/foundation.dart';
import 'package:tourist_helper/models/fav_list_Model.dart';

class FavouritePageModel extends ChangeNotifier{
 late FavouriteListModel _favouritelist;
 final List<int>_itemIds=[];
 FavouriteListModel get favouritelist => _favouritelist;
 set favouritelist(FavouriteListModel newList){
  _favouritelist=newList;
  notifyListeners();
 }
List get items =>
    _itemIds.map((id) => _favouritelist.getById(id)).toList();
 void add (Item item){
  _itemIds.add(item.id);
  notifyListeners();
 }

 void remove (Item item){
  _itemIds.remove(item.id);
  notifyListeners();
 }
}


//  final uid = FirebaseAuth.instance.currentUser!.uid;
//   final email = FirebaseAuth.instance.currentUser!.email;
//   final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
//   GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
//   User? user = FirebaseAuth.instance.currentUser;