import 'package:flutter/material.dart';
import 'package:flutter_application/src/providers/locale_provider.dart';
import 'package:flutter_application/src/providers/todo_provider.dart';
import 'package:flutter_application/src/ui/screens/home_screen.dart';
import 'package:flutter_application/src/ui/screens/profile_screen.dart';
import 'package:flutter_application/src/ui/screens/todo_list/todo_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
          ChangeNotifierProvider(create: (_) => TodoProvider())
        ],
        child: Consumer<LocaleProvider>(builder: (context, provider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            locale: provider.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const MyHomePage(title: 'Flutter Demo Home Page '),
          );
        }));
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
        icon: const Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: localizations?.todoList,
        icon: const Icon(Icons.list),
      ),
      BottomNavigationBarItem(
        label: localizations?.profile,
        icon: const Icon(Icons.person),
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
