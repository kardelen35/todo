import 'package:flutter/material.dart';
import 'package:todo/api.dart';
import 'package:todo/home_page.dart';
import 'package:todo/list_model.dart';

import 'add_item.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoApp'),
        backgroundColor: Colors.cyan[300],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context, builder: (BuildContext context) => AddItem());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan[300],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan[300],
        unselectedItemColor: Colors.grey.shade500,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
        currentIndex: _selectedIndex,
        onTap: (int value) {
          setState(() {
            _selectedIndex =
                value; // we report that the widget item has changed
          });
          _pageController.jumpToPage(value);
        },
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
