import 'package:flutter/material.dart';
import 'package:flutter_application/src/ui/screens/home_screen.dart';
import 'package:flutter_application/src/ui/screens/profile_screen.dart';
import 'package:flutter_application/src/ui/screens/todo_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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

    final localizations = AppLocalizations.of(context);

    final List<BottomNavigationBarItem> _bottomNavigationBarItems =
        <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: localizations?.home,
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: localizations?.todoList,
        icon: Icon(Icons.list),
      ),
      BottomNavigationBarItem(
        label: localizations?.profile,
        icon: Icon(Icons.person),
      ),
    ];

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
