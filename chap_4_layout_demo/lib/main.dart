/*
 * @Author       : Linloir
 * @Date         : 2022-02-10 14:44:56
 * @LastEditTime : 2022-02-13 19:36:20
 * @Description  : 
 */
import 'package:chap_4_layout_demo/stack_demo.dart';
import 'package:flutter/material.dart';
import './flow_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Layout demo",
      routes: {
        "/": (context) => const HomePage(),
        "/Flow": (context) => const FlowPage(),
        "/Stack": (context) => const StackPage(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Demo'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(width: 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: Row(
                    children: const [
                      Icon(Icons.layers_rounded),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('Flow Layout'),
                      )
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/Flow'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: Row(
                    children: const [
                      Icon(Icons.layers_rounded),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text('Stack Layout'),
                      )
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/Stack'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}