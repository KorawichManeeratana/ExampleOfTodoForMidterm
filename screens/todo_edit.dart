import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/Todo_info.dart';

class TodoEdit extends StatefulWidget {
  final TodoInfo todo;
  const TodoEdit({super.key, required this.todo});

  @override
  State<TodoEdit> createState() => _TodoEditStage();
}

class _TodoEditStage extends State<TodoEdit> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Todo')),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: super.widget.todo.title,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: descController,
                      decoration: InputDecoration(
                        labelText: super.widget.todo.description,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: () {
                      TodoInfo updatedTodo = TodoInfo(
                        title: titleController.text,
                        description: descController.text,
                      );

                      // ปิดหน้านี้และส่งข้อมูลกลับไปหน้าแรก
                      Navigator.pop(context, updatedTodo);
                    },
                    child: Text("Save Changes"),
                    style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
