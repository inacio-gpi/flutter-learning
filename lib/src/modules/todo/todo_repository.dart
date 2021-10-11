import 'package:dio/dio.dart';
import 'package:flutter_learning/src/models/todo_modal.dart';

class TodoRepository {
  // final dio = Dio();
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) : dio = client ?? Dio();
  // mesma coias abaixo
  // TodoRepository([Dio? client]) {
  //   if (client == null) {
  //     this.dio = Dio();
  //   } else {
  //     this.dio = client;
  //   }
  // }
  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
    // mesma coisa q abaixo;
    // List<TodoModel> todos = [];
    // for (var json in list) {
    //   final todo = TodoModel.fromJson(json);
    //   todos.add(todo);
    // }
    // return todos;
  }
}
