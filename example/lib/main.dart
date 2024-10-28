import 'package:example/page2/page2_page.dart';
import 'package:example/page3/page3_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page1/page1_page.dart';

abstract class Paths {
  static const main = '/';
  static const page1 = '/page1';
  static const page2 = '/page2';
  static const page3 = '/page3';

  static routeName(String name){
    if(name == '/') return '/';
    if(name.startsWith('/')){
      name = name.replaceFirst('/', '');
    }
    return name;
  }
}


class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    observers: <NavigatorObserver>[
      // routeObserver,
      // EventRoute(),
      // SentryNavigatorObserver(),
      // RouteChangeObserver(),
    ],
    initialLocation: Paths.main,
    routes: <RouteBase>[
      GoRoute(
        path: Paths.main,
        name: Paths.routeName(Paths.main),
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: Paths.page1,
        name: Paths.routeName(Paths.page1),
        builder: (context, state) {
          print("传递的数据: ${state.extra}");
          return const Page1Page();
        },
      ),

      GoRoute(
        path: Paths.page2,
        name: Paths.routeName(Paths.page2),
        builder: (context, state) => const Page2Page(),
      ),

      GoRoute(
        path: Paths.page3,
        name: Paths.routeName(Paths.page3),
        builder: (context, state) => const Page3Page(),
      ),
    ],
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routerConfig: AppPages.router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  void _incrementCounter() {
      context.go('/page1', extra: {'key1': 111});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
