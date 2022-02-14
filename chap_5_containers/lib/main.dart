/*
 * @Author       : Linloir
 * @Date         : 2022-02-13 21:39:51
 * @LastEditTime : 2022-02-14 10:47:09
 * @Description  : 
 */
import 'package:flutter/material.dart';
import './scaffold_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Containers demo',
      home: const HomePage(),
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
        title: const Text('Containers Demo App'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints.expand(height: 40.0),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.view_carousel_rounded),
                      ),
                      Text('Scaffold Page'),
                    ],
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaffoldPage())),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
