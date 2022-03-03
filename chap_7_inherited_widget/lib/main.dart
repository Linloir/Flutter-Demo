/*
 * @Author       : Linloir
 * @Date         : 2022-03-01 10:20:01
 * @LastEditTime : 2022-03-03 17:01:14
 * @Description  : 
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Demo',
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pressedCount = 0;

  final test = TestBuildWidget();

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SharedDataWidget(
              child: test,
              data: _pressedCount,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                child: const Icon(Icons.add),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                onPressed: () => setState(() {
                  _pressedCount++;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SharedDataWidget extends InheritedWidget {
  const SharedDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final int data;

  static SharedDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
        'The button is pressed ${SharedDataWidget.of(context)?.data} times');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependency changed');
  }
}

class TestBuildWidget extends StatelessWidget {
  const TestBuildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Rebuilt');
    return TestWidget();
  }
}
