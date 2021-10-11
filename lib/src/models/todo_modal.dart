// Future<Map> fetch() async {
//   var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
//   var response = await http.get(url);
//   var json = jsonDecode(response.body);
//   var todo = Todo.fromJson(json);
//   return json;
//   // json['title']
// }
class TodoModel {
  final String? title;
  final int? id;
  final int? userId;
  final bool? completed;

  TodoModel({
    this.title,
    this.id,
    this.userId,
    this.completed,
  });

  factory TodoModel.fromJson(Map json) {
    return TodoModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
  Map toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }
}
