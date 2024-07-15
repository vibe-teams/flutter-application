import 'package:flutter/material.dart';
import 'package:flutter_application/src/models/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> todoList = [
    Todo(
      title: 'Todo 1',
      description: 'Description 1',
    ),
    Todo(
      title: 'Todo 2',
      description: 'Description 2',
    ),
    Todo(
      title: 'Todo 3',
      description: 'Description 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          padding: const EdgeInsets.all(8),
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final item = todoList[index];
            return Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    todoList.removeAt(index);
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
                  title: Text(todoList[index].title),
                  subtitle: Text(todoList[index].description),
                ));
          },
          // itemBuilder: (context, index) =>
        ),
        // child: ListView(
        //   children: [
        //     ListTile(
        //       title: Text('Todo 1'),
        //       subtitle: Text('Description 1'),
        //       trailing: IconButton(
        //         icon: const Icon(Icons.delete),
        //         onPressed: () {},
        //       ),
        //     ),
        //     ListTile(
        //       title: Text('Todo 2'),
        //       subtitle: Text('Description 2'),
        //       trailing: IconButton(
        //         icon: const Icon(Icons.delete),
        //         onPressed: () {},
        //       ),
        //     ),
        //     ListTile(
        //       title: Text('Todo 3'),
        //       subtitle: Text('Description 3'),
        //       trailing: IconButton(
        //         icon: const Icon(Icons.delete),
        //         onPressed: () {},
        //       ),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-todo');
        },
        tooltip: 'Create Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
