/*
 * @Author       : Linloir
 * @Date         : 2022-02-14 00:39:57
 * @LastEditTime : 2022-02-14 01:14:32
 * @Description  : Scaffold demo page
 */

import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  var _selectedIndex = 1;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Demo Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: (){},
          ),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business'
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){},
      ),
      body: Center(
        child: SizedBox(
          width: 100.0,
          height: 40.0,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.arrow_back),
                ),
                Text('Back'),
              ],
            ),
            onPressed: () => Navigator.pop(context),
          ),
        )
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
    );
  }
}
