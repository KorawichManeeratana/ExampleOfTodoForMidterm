import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Todo_info.dart';
import 'package:flutter_application_1/widgets/todo_list_card.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoApp());
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<TodoInfo> todos = [
    TodoInfo(title: "But Shampoo", description: "or i will not take a shower"),
    TodoInfo(title: "Do HomeWork", description: "Math and Scrience"),
    TodoInfo(title: "Practice Mock Exam", description: "or i might fail"),
  ];

  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  void addTodo() {
    if (titleController.text.isEmpty || descController.text.isEmpty) {
      return;
    }

    setState(() {
      todos.add(
        TodoInfo(title: titleController.text, description: descController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          SizedBox(height: 24),
          Text(
            "Todo List",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          ListView(
            shrinkWrap: true,
            children: [
              for (var todo in todos)
                TodoCard(
                  todo: todo,
                  onDelete: () {
                    setState(() {
                      todos.remove(todo);
                    });
                  },
                  onEdit: (updateTodo) {
                    setState(() {
                      final index = todos.indexOf(todo);
                      if (index != -1) {
                        todos[index] = updateTodo;
                      }
                    });
                  },
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // คราวนี้ context ตรงนี้จะหา MaterialApp เจอแน่นอน
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add New Todo"),
                content: SingleChildScrollView(
                  // ป้องกันจอเตี้ยแล้วล้น
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // ให้ Column กระชับพอดีของข้างใน
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: descController,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: addTodo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                        ),
                        child: const Text("Add Todo"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
