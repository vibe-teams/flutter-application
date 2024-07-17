import 'package:flutter/material.dart';
import 'package:flutter_application/src/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          padding: const EdgeInsets.all(8),
          itemCount: todoProvider.todoList.length,
          itemBuilder: (context, index) {
            final item = todoProvider.todoList[index];
            return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    todoProvider.remove(item);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.title} dismissed')),
                  );
                },
                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                ));
          },
          // itemBuilder: (context, index) =>
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-todo');
          //     .catchError(() => print("Navigate to Create Todo Screen"));

          print("Navigate to Create Todo Screen");
        },
        tooltip: 'Create Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
