import 'package:flutter/material.dart';
import 'package:flutter_learning/src/modules/todo/todo_controller.dart';

class TodoPage extends StatefulWidget {
  // const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final controller = TodoController();
  _success() {
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            title: Text(todo.title!),
          );
        });
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tentar novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(TodoState state) {
    switch (state) {
      case TodoState.start:
        return _start();
      case TodoState.loading:
        return _loading();
      case TodoState.error:
        return _error();
      case TodoState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Todo\'s'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.start();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
      //  Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       var future = Future.delayed(Duration(seconds: 2));
      //       future.then((value) => print('novo 4'));
      //       print('1');
      //       print('2');
      //       print4();
      //     },
      //     child: Text('olas'),
      //   ),
      // ),
    );
  }

  Future<void> print4() async {
    await Future.delayed(Duration(seconds: 1));
    print('4');
  }
}
