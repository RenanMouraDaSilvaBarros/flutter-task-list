import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/components/my_button.dart';
import 'package:task_list/components/my_textfield.dart';
import 'package:task_list/providers/task_provider.dart';

class TaskListAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final textController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionando'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: MyTextField(
                controller: textController,
                hintText: 'Tarefa',
                maxLength: 30,
                textStyle: const TextStyle(color: Colors.white),
                validator: (value) => taskProvider.taskIsValid(value!),
              ),
            ),
            MyButton(
                buttonColor: const Color(0xffFE4080),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    taskProvider.addTask(textController.text);
                    Navigator.pop(context);
                  }
                },
                title: "Adicionar tarefa"),
          ],
        ),
      ),
    );
  }
}
