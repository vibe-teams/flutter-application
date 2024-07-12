import 'package:flutter/material.dart';
import 'package:flutter_application/src/ui/screens/home_screen.dart';
import 'package:flutter_application/src/ui/screens/profile_screen.dart';
import 'package:flutter_application/src/ui/screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavigationBarItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(label: 'Todo List', icon: Icon(Icons.list)),
    BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
  ];
  final List<Widget> _pages = <Widget>[
    HomeScreen(),
    TodoListScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = _bottomNavigationBarItems[_selectedIndex].label ?? '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ), // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: theme.colorScheme.primary,
        ));
  }
}
