import 'package:flutter/material.dart';

class AddNewToDo extends StatefulWidget {
  const AddNewToDo({super.key});

  @override
  State<AddNewToDo> createState() => _AddNewToDoState();
}
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController _titleTEcontroller = TextEditingController();
final TextEditingController _descriptionTEcontroller = TextEditingController();

class _AddNewToDoState extends State<AddNewToDo> {
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
                validator: (String? value){
                  final v=value?? '';
                  if (v.trim().isEmpty) {
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
                validator: (String? value){
                  final v=value?? '';
                  if (v.trim().isEmpty) {
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
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.pop(context);
                  }  
                }, child: const Text('Add')),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
    super.dispose();
  }
}
