import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todo/list_model.dart';

class ToDoService {
  Future<List<ToDoModel>> fetchToDo() async {
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<ToDoModel> todos = body
          .map(
            (dynamic item) => ToDoModel.fromJson(item),
          )
          .toList();

      return todos;
      // Iterable todo = json.decode(response.body);
      // todo.map((todos) => ToDoModel.fromJson(todos)).toList();
      // return ToDoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ToDo');
    }
  }
}
