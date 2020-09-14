import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list-item.dart';

class NameList extends StatelessWidget {
  NameList({Key key, this.nameList, this.favoriteList, this.isListFavorite, @required this.onDeleteItem, this.toggleFavorite})
      : super(key: key);
  final ValueChanged<String> onDeleteItem;
  final ValueChanged<String> toggleFavorite;
  final List<String> nameList;
  final List<String> favoriteList;
  final bool isListFavorite;

  void _onDeleteItem(String name) {
    onDeleteItem(name);
  }

  void _toggleFavorite(String name) {
    toggleFavorite(name);
  }

  List<Widget> getList(List list) {
    return list.map((name) => Container(
        margin: EdgeInsets.only(top: 15),
        child: Center(
            child: Column(
              children: [
                ListItem(
                  name: name,
                  isFavorite: favoriteList.contains(name),
                  onDeleteItem: _onDeleteItem,
                  toggleFavorite: _toggleFavorite,
                ),
                Divider(thickness: 1)
              ],
            )
        )
    )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: isListFavorite ? getList(favoriteList) : getList(nameList)
    );
  }
}
