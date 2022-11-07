import 'package:flutter_crud_http_api/models/todoModel.dart';
import 'package:flutter_crud_http_api/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository {
  // Use http
  String dataUrl = "https://jsonplaceholder.typicode.com";

  @override
  Future<String> deletedTodo(Todo todo) {
    // TODO: implement deletedTodo
    throw UnimplementedError();
  }

// GET
  @override
  Future<List<Todo>> getTodoList() async {
    // TODO: implement getTodoList
    // throw UnimplementedError();
    List<Todo> todoList = [];
    var url = Uri.parse('$dataUrl/todos');
    var response = await http.get(url);
    // print('Status Code : ${response.statusCode} ${response.body}');
    var body = json.decode(response.body); // convert

    //  Parse
    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

// Patch
// here modify passed varible only
  @override
  Future<String> patchCompleted(Todo todo) async {
    // TODO: implement patchCompleted
    // throw UnimplementedError();
    var url = Uri.parse('$dataUrl/todos/${todo.id}');
    // call back data
    String resData = '';
    // bool? => String
    await http.patch(
      url,
      body: {
        'completed': (todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      // homescreen => data
      Map<String, dynamic> result = json.decode(response.body);
      // print("patchResult-> $result");
      return resData = result['completed'];
    });

    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Todo todo) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
}
