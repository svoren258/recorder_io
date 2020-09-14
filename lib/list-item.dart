import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({Key key, this.isFavorite, this.name = '', @required this.onDeleteItem, this.toggleFavorite})
      : super(key: key);

  final ValueChanged<String> onDeleteItem;
  final ValueChanged<String> toggleFavorite;
  final bool isFavorite;
  final String name;

  void _onDeleteItem(String name) {
    onDeleteItem(name);
  }

  void _toggleFavorite(String name) {
    toggleFavorite(name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    _toggleFavorite(name);
                  },
                ),
                IconButton(
                    icon: Icon(
                        Icons.delete,
                        color: Colors.red
                    ),
                    onPressed: () {
                      _onDeleteItem(name);
                    }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
