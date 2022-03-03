/*
 * @Author       : Linloir
 * @Date         : 2022-03-02 19:37:39
 * @LastEditTime : 2022-03-02 20:17:15
 * @Description  : 
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited widget demo'),
      ),
      body: Center(
        child: TestWidget(
          child: DisplayWidget(),
        ),
      ),
    );
  }
}

class Wrapper {
  const Wrapper(this.count);
  final List count;
}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final Wrapper counter = const Wrapper([0]);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  void _onPressed() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedDataWidget(
          child: widget.child,
          data: widget.counter.count[0],
        ),
        ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: _onPressed,
        )
      ],
    );
  }
}

class SharedDataWidget extends InheritedWidget {
  const SharedDataWidget({Key? key, required this.data, required child})
      : super(key: key, child: child);

  final int data;

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }

  static SharedDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }
}

class DisplayWidget extends StatefulWidget {
  const DisplayWidget({Key? key}) : super(key: key);

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("Pushed ${SharedDataWidget.of(context)?.data} times");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
