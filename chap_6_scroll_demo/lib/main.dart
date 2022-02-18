import 'package:chap_6_scroll_demo/infinitelistview.dart';
import 'package:flutter/material.dart';
import './listviewdemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Scrollable Demo App',
      routes: {
        '/': (context) => const HomePage(),
        '/ListView':(context) => const ListViewPage(),
        '/InfListView': (context) => InfListViewPage(),
      },
      initialRoute: '/',
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
        title: const Text('Scrollable Components Demo Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.list_alt_rounded),
                      ),
                      Text('List View'),
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/ListView'),
                ),
              ),Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.list_alt_rounded),
                      ),
                      Text('Infinite List View'),
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/InfListView'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}