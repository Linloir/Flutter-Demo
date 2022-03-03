/*
 * @Author       : Linloir
 * @Date         : 2022-03-03 15:39:37
 * @LastEditTime : 2022-03-03 23:52:37
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
      title: 'Theme demo',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MaterialColor _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    final themeData = context.findAncestorWidgetOfExactType<Theme>()!.data;
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Theme demo page'),
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Icon(Icons.airport_shuttle),
                  Builder(builder: (context) {
                    return const Icon(Icons.airport_shuttle);
                  },),
                  const Text('Text theme'),
                ],
              ),
              Theme(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.airport_shuttle),
                    Text('Black Theme'),
                  ],
                ),
                data: themeData.copyWith(
                    iconTheme: const IconThemeData(color: Colors.black)),
              )
            ],
          )),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.color_lens),
            onPressed: () {
              setState(() {
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal;
              });
            },
          )),
    );
  }
}
