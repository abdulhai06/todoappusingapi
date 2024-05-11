import 'package:flutter/material.dart';
import 'package:todo_api/todo.dart';

class EditNewToDo extends StatefulWidget {
  const EditNewToDo({super.key, required this.todo});

  final Todo todo;

  @override
  State<EditNewToDo> createState() => _EditNewToDoState();
}

class _EditNewToDoState extends State<EditNewToDo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleTEcontroller.text = widget.todo.title;
    _descriptionTEcontroller.text = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: _titleTEcontroller,
                validator: (String? value) {
                  final v = value ?? '';
                  if (v
                      .trim()
                      .isEmpty) {
                    return 'Enter your title';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _descriptionTEcontroller,
                validator: (String? value) {
                  final v = value ?? '';
                  if (v
                      .trim()
                      .isEmpty) {
                    return 'Enter your title';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                maxLines: 5,
                maxLength: 100,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery
                    .sizeOf(context)
                    .width,
                child: ElevatedButton(onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Todo todo = Todo(
                        _titleTEcontroller.text, _descriptionTEcontroller.text,
                        DateTime.now());
                    Navigator.pop(context, todo);
                  }
                }, child: const Text('Update')),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
  }
}
