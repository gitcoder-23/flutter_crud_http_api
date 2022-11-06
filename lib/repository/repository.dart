// fake Server

// https://jsonplaceholder.typicode.com/todos

import 'package:flutter_crud_http_api/models/todoModel.dart';

abstract class Repository {
  // Get
  Future<List<Todo>> getTodoList();
  // Patch
  Future<String> patchCompleted(Todo todo);
  // Put
  Future<String> putCompleted(Todo todo);
  // Delete
  Future<String> deletedTodo(Todo todo);
  // Post
  Future<String> postTodo(Todo todo);
}

// {
// "userId": 1,
// "id": 1,
// "title": "delectus aut autem",
// "completed": false
// }
