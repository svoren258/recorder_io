
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsNavigation extends StatelessWidget {
  TabsNavigation({Key key, this.selectedTabIndex: 0, @required this.onChanged})
      : super(key: key);
  final ValueChanged<int> onChanged;
  final int selectedTabIndex;

  void _onTabChanged(int index) {
    onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
      ],
      currentIndex: selectedTabIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTabChanged,
    );
  }
}