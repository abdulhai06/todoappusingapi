import 'package:flutter/material.dart';

import 'add_new_todo.dart';
import 'edit_todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
        ),
      ),
      body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: const Text('Todo Title'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('todo body'),
                  Text('time'),
                ],
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditNewToDo()));
                      },
                      icon: const Icon(Icons.edit)),
                   IconButton(
                      onPressed: showDeleteConfirmationDialog,
                      icon: const Icon(Icons.delete)),
                ],
              ),
            );
          },
        separatorBuilder: (context, index){
            return Divider(
              color: Colors.blueGrey,
              height: 10,
              indent: 16,
              endIndent: 16,
            );
        },

          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewToDo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  void showDeleteConfirmationDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            title: const Text('Delete Confirmation'),
            content: const Text('Are you sure want to Delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    // Perform deletion operation here
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          );
        });
  }
}


