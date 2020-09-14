
import 'package:flutter/material.dart';
import 'package:recorder_io/name-list.dart';
import 'package:recorder_io/side-menu.dart';
import 'package:recorder_io/tabs-navigation.dart';
import 'custom-form.dart';

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  int _selectedTabIndex = 0;
  List<String> _nameList = List<String>();
  List<String> _favoriteList = List<String>();

  void _updateList(String name) {
    setState(() {
      _nameList = [..._nameList, name];
    });
  }

  void _createItem() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Create Item'),
            ),
            body: CustomForm(
              onChanged: _updateList,
            ),
          );
        }, // ...to here.
      ),
    );
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onDeleteItem(String name) {
    setState(() {
      _nameList = _nameList.where((element) => element != name).toList();
      _favoriteList = _favoriteList.where((element) => element != name).toList();
    });
  }
  
  void _toggleFavorite(String name) {
    setState(() {
      if (_favoriteList.contains(name)) {
        _favoriteList = _favoriteList.where((element) => element != name).toList();
      } else {
        _favoriteList = [..._favoriteList, name];
      }
    });
  }
  
  Widget _getSelectedTabView() {
    if (_selectedTabIndex == 0) {
      return NameList(
        nameList: _nameList,
        favoriteList: _favoriteList,
        isListFavorite: false,
        toggleFavorite: _toggleFavorite,
        onDeleteItem: _onDeleteItem,
      );
    } else if (_selectedTabIndex == 1) {
      return NameList(
        nameList: _nameList,
        favoriteList: _favoriteList,
        isListFavorite: true,
        toggleFavorite: _toggleFavorite,
        onDeleteItem: _onDeleteItem,
      );
    } else {
      return NameList(
        nameList: _nameList,
        favoriteList: _favoriteList,
        isListFavorite: false,
        toggleFavorite: _toggleFavorite,
        onDeleteItem: _onDeleteItem,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECorder.io'),
      ),
      drawer: SideMenu(),
      body: Container(
          margin: EdgeInsets.only(top: 15),
          child: Center(
            child: _getSelectedTabView()
          )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: _createItem,
      ),
      bottomNavigationBar: TabsNavigation(
        selectedTabIndex: _selectedTabIndex,
        onChanged: _onTabChanged,
      )
    );
  }
}