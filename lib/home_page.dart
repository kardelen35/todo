import 'package:flutter/material.dart';
import 'package:todo/api.dart';
import 'package:todo/list_model.dart';

import 'package:flutter/material.dart';

import 'list_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder:
          (BuildContext context, AsyncSnapshot<List<ToDoModel>> snapshot) {
        if (snapshot.hasData) {
          List<ToDoModel> todos = snapshot.data;
          return ListView(
            children: todos
                .map(
                  (ToDoModel model) => ListTile(
                    title: Text(model.title),
                    subtitle: Text("${model.userId}"),
                  ),
                )
                .toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
