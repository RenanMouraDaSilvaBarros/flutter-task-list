import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/components/my_button.dart';
import 'package:task_list/components/my_textfield.dart';
import 'package:task_list/providers/task_provider.dart';

class TaskListEditScreen extends StatelessWidget {
  final int index;
  const TaskListEditScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    final textController =
        TextEditingController(text: taskProvider.listTask[index]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editando',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: MyTextField(
                controller: textController,
                hintText: 'Tarefa',
                maxLength: 30,
                textStyle: TextStyle(color: Colors.white),
                validator: (value) => taskProvider.taskIsValid(value!),
              ),
            ),
            MyButton(
                buttonColor: Color(0xffFE4080),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    taskProvider.editTask(index, textController.text);
                    Navigator.pop(context);
                  }
                },
                title: "Editar tarefa"),
          ],
        ),
      ),
    );
  }
}
