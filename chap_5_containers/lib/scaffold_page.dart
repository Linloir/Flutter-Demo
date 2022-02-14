/*
 * @Author       : Linloir
 * @Date         : 2022-02-14 00:39:57
 * @LastEditTime : 2022-02-14 15:16:02
 * @Description  : Scaffold demo page
 */

import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> with SingleTickerProviderStateMixin{
  var _selectedIndex = 1;

  TabController? _tabController;
  var tabs = ['Page 1', 'Page 2', 'Page 3'];

  @override
  void initState(){
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

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
        elevation: 4.0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: const MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business'
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_rounded),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.business),
              onPressed: (){},
            ),
            const SizedBox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          switch(e){
            case 'Page 1':
              return Center(
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
              );
            default:
              return Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 2,),
              );
          }
        }).toList(),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: ClipOval(
                      child: Image.asset('imgs/avatar.png', width: 80,),
                    ),
                  ),
                  const Text('Linloir'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text('Back'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
