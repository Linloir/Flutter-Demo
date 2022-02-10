/*
 * @Author       : Linloir
 * @Date         : 2022-02-10 14:44:56
 * @LastEditTime : 2022-02-10 21:22:30
 * @Description  : 
 */
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
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}