/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 08:53:39
 * @LastEditTime : 2022-03-04 10:33:27
 * @Description  : 
 */
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asynchronous builder demo app',
      routes: {
        "/": (context) => const HomePage(),
        "/FutureBuilder": (context) => const FutureBuilderPage(),
        "/StreamBuilder": (context) => const StreamBuilderPage(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous builder demo home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton(
                child: const Text('Future builder'),
                onPressed: (){
                  Navigator.of(context).pushNamed("/FutureBuilder");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton(
                child: const Text('Stream builder'),
                onPressed: (){
                  Navigator.of(context).pushNamed('/StreamBuilder');
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

Future<String> fakeNetWorkConnection() {
  return Future.delayed(const Duration(seconds: 2), () => 'Context: received.');
}

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future builder demo'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fakeNetWorkConnection(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasData){
                return Text(snapshot.data);
              }
              else{
                return const Text('Error occurred');
              }
            }else{
              return const SizedBox(
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Stream<int> simulateIntStream() async* {
  for(int i = 0; i < 10; i++){
    yield i;
    await Future.delayed(const Duration(seconds: 1));
  }
}

class StreamBuilderPage extends StatelessWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream builder demo page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: simulateIntStream(),
          builder: (context, snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.none: {
                return const Text("Awaiting to start");
              }
              case ConnectionState.waiting: {
                return const SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                  ),
                );
              }
              case ConnectionState.active: {
                return Text("${snapshot.data}");
              }
              default: {
                if (snapshot.connectionState == ConnectionState.done){
                  return const Text('Stream completed');
                }
                else{
                  return const Text('Err occurred');
                }
              }
            }
          },
        )
      ),
    );
  }
}