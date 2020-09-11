// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'custom-form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: TitlePage(),
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
    );
  }
}

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  int _selectedTabIndex = 0;
  List<String> _nameList = List<String>();
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
            body: MyCustomForm(
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
  List<Widget> _createNameList() {
    return _nameList.map((name) => Container(
        margin: EdgeInsets.only(top: 15),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('RECorder.io'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Container(
            margin: EdgeInsets.only(top: 15),
            child: Center(
              child: ListView(
                children: _createNameList()
              ),
            )
          ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: _createItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onTabChanged,
      ),
    );
  }
}
