import 'package:flutter_crud_http_api/models/todoModel.dart';
import 'package:flutter_crud_http_api/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  // get Todo
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  // Patch Todo
  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }
}
