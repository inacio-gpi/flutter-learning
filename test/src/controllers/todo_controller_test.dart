import 'package:dio/dio.dart';
import 'package:flutter_learning/src/models/todo_modal.dart';
import 'package:flutter_learning/src/modules/todo/todo_controller.dart';
import 'package:flutter_learning/src/modules/todo/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = TodoController(repository);

  test('deve preencer variavel todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.success);
    expect(controller.todos.isNotEmpty, true);
  });
  test('deve modificar o estado para error se a requisição falhar ', () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.error);
  });
}
