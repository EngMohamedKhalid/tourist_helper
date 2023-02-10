import 'package:tourist_helper/models/fav_list_Model.dart';
import 'package:tourist_helper/models/fav_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/localization/appLocal.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
           "fav ",
        ),
        actions: [
              IconButton(
                icon: Icon(Icons.favorite_outline_rounded),
                onPressed: () => Navigator.pushNamed(context, '/favouritepage'),
              ),
            ],
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   floating: true,
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.favorite_outline_rounded),
          //       onPressed: () => Navigator.pushNamed(context, '/favouritepage'),
          //     ),
          //   ],
          // ),
           SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _MyListItem(index);
            }, childCount: 25),
          )
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var item = context.select<FavouriteListModel, Item>(
      (favouriteList) => favouriteList.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.Image),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: textTheme,
                ),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            )),
            const SizedBox(
              width: 24,
            ),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavouritePage = context.select<FavouritePageModel, bool>(
      (favouritepage) => favouritepage.items.contains(item),
    );
    return IconButton(
      onPressed: isInFavouritePage
          ? () {
              var favouritepage = context.read<FavouritePageModel>();
              favouritepage.remove(item);
            }
          : () {
              var favouritepage = context.read<FavouritePageModel>();
              favouritepage.add(item);
            },
      icon: isInFavouritePage
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(Icons.favorite_border),
    );
  }
}
