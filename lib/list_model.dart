import 'dart:convert';

import 'package:flutter/material.dart';

class ToDoModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  ToDoModel(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
