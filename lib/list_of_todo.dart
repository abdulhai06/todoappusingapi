import 'package:flutter/material.dart';
import 'package:todo_api/todo.dart';

import 'add_new_todo.dart';
import 'edit_todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

List<Todo> todoList = [];

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
        ),
      ),
      body: Visibility(
        visible: todoList.isNotEmpty,
        replacement:  const Center(
          child: Text('Your Todo List is Empty'),
        ),
        child: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todoList[index].description),
                Text(todoList[index].dateTime.toString()),
              ],
            ),
            trailing: Wrap(
              children: [
                IconButton(
                    onPressed: () async{
                      Todo? updatedtodo= await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  EditNewToDo(
                            todo: todoList[index] ,
                          ),),);
                      if (updatedtodo != null) {
                        todoList[index] = updatedtodo;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () => showDeleteConfirmationDialog(index),
                    icon: const Icon(Icons.delete)),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.blueGrey,
            height: 10,
            indent: 16,
            endIndent: 16,
          );
        },
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        onPressed: _ontapAddNewTodoFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _ontapAddNewTodoFAB() async {
    final Todo? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewToDo(),
      ),
    );
    if (result != null) {
      todoList.add(result);
      setState(() {});
    }
  }

  void showDeleteConfirmationDialog(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    todoList.removeAt(index);
                    setState(() {});

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
