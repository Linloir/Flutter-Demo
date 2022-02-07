import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';

import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _liked = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('You ' + (_liked ? 'liked ' : 'disliked ') + 'last page'),
            TextButton(
              child: const Text(
                'New pg',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () async {
                var res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewPage(lastPressedCount: _counter),
                  ),
                );
                setState(() {
                  _liked = res ?? _liked;
                });
              },
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

class NewPage extends StatefulWidget {
  const NewPage({Key? key, required this.lastPressedCount}) : super(key: key);

  final int lastPressedCount;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  bool isThumbUp = false;
  final randomWord = WordPair.random();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is a new page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.thumb_up),
        onPressed: (){
          setState(() {
            isThumbUp = !isThumbUp;
          });
        },
        backgroundColor: isThumbUp ? Colors.pink : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(!isThumbUp ? 'You haven\'t pressed like btn' : 'You liked this page!'),
            Text('You have pressed ${widget.lastPressedCount} times of button before you entered this page'),
            const Text('The random word this time is'),
            Text(randomWord.toString(), style: Theme.of(context).textTheme.headline4,),
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context, isThumbUp);
              },
            )
          ],
        ),
      ),
    );
  }
}
