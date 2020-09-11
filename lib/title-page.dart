
import 'package:flutter/material.dart';
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
      drawer: SideMenu(),
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
      bottomNavigationBar: TabsNavigation(
        selectedTabIndex: _selectedTabIndex,
        onChanged: _onTabChanged,
      )
    );
  }
}