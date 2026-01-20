import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/Todo_info.dart';
import "../screens//todo_edit.dart";

class TodoCard extends StatelessWidget {
  final TodoInfo todo;
  final VoidCallback? onDelete;
  final Function(TodoInfo) onEdit;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          onPressed: () async {
            final updatedData = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoEdit(todo: todo)),
            );

            if (updatedData != null) {
              onEdit(updatedData);
            }
          },
          icon: Icon(Icons.edit),
        ),
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
