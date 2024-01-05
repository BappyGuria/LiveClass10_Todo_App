import 'package:flutter/material.dart';

import 'add_new_todo_modal.dart';
import 'update_todo_modal.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Actions'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        const UpdateTodoModal(),
                                  );
                                },
                                title: const Text('Update'),
                                leading: const Icon(Icons.edit),
                              ),
                              const Divider(
                                height: 5,
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text('Delete'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      });
                },
                title: const Text('Hello Word !'),
                leading: Text('${index + 1}'),
                trailing: const Text('Pending'),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNewTodoModal();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
