<<<<<<< HEAD
import 'package:flutter/material.dart';


Future<void> main() async {

  // await func1();
  // await func2();

  await Future.wait([
    func1(),
    func2(),
  ]);

  runApp(const MyApp());
}

Future<void> func1() async {
  await Future.delayed(const Duration(seconds: 1));
  print("func1");
}

Future<void> func2() async {
  await Future.delayed(const Duration(seconds: 1));
  print("func2");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PermissionManager(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class PermissionManager extends StatefulWidget {
  final Widget child;

  const PermissionManager({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<PermissionManager> createState() => _PermissionManagerState();
}

class _PermissionManagerState extends State<PermissionManager> {

  @override
  void initState() {
    //listen permission
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double top = 200;

  void _incrementCounter() {
    setState(() {
      if (top == 200) {
        top = 0;
        return;
      }

      top = 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    //material app
    //home
    //scafold
    //container

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
      body: SizedBox(
        height: 300,
        child: Column(
          children: [
            // Stack(
            //   children: [
            //     Container(
            //       height: 250,
            //       color: Colors.blue,
            //     ),
            //     AnimatedPositioned(
            //       duration: const Duration(milliseconds: 700),
            //       left: 50,
            //       right: 50,
            //       // bottom: 0,
            //       top: top,
            //       child: Container(
            //         height: 100,
            //         width: 300,
            //         decoration: const BoxDecoration(
            //           color: Colors.white,
            //           borderRadius:  BorderRadius.all(Radius.circular(10)),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),

            containerBlue(),
            const ContainerBase(),
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

  Widget containerBlue() {
    print("containerBlue");
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      color: Colors.pink,
    );
  }
}

class ContainerBase extends StatelessWidget {
  const ContainerBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ContainerBase");
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      color: Colors.green,
    );
  }
}
=======

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app_module.dart';
import 'package:weather/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
>>>>>>> master
