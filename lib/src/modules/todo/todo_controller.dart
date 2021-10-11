import 'package:flutter/widgets.dart';
import 'package:flutter_learning/src/models/todo_modal.dart';
import 'package:flutter_learning/src/modules/todo/todo_repository.dart';

class TodoController {
  List<TodoModel> todos = [];
  late final TodoRepository _repository;
  // final repository = TodoRepository();
  final state = ValueNotifier<TodoState>(TodoState.start);
  // TodoState state = TodoState.start;
  TodoController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();
  Future start() async {
    state.value = TodoState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = TodoState.success;
    } catch (e) {
      state.value = TodoState.error;
    }
  }
}

enum TodoState { start, loading, success, error }
