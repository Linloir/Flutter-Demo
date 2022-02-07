/*
 * @Author       : Linloir
 * @Date         : 2022-02-05 17:33:53
 * @LastEditTime : 2022-02-06 18:05:18
 * @Description  : 
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'State management demo',
      routes: {
        "/" : (context) => const MyHomePage(),
        "/self" : (context) => const SelfStateDemoPage(),
        "/father" : (context) => const FatherStateDemoPage(),
        "/migrate" : (context) => const MigrateStateDemoPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/self'),
              child: const Text('Self'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/father'),
              child: const Text('Father'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/migrate'),
              child: const Text('Migrate'),
            ),
          ],
        ),
      ),
    );
  }
}

class SelfStateDemoPage extends StatelessWidget {
  const SelfStateDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage state by widget itself'),
      ),
      body: const Center(
        child: TapBoxA(),
      ),
    );
  }
}

class FatherStateDemoPage extends StatelessWidget {
  const FatherStateDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage state by father widget'),
      ),
      body: const Center(
        child: TapBoxBParent(),
      ),
    );
  }
}

class MigrateStateDemoPage extends StatelessWidget {
  const MigrateStateDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Migrate state managing'),
      ),
      body: const Center(
        child: TapBoxCParent(),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  const TapBoxA({Key? key}) : super(key: key);

  @override
  State<TapBoxA> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapBoxBParent extends StatefulWidget {
  const TapBoxBParent({Key? key}) : super(key: key);

  @override
  State<TapBoxBParent> createState() => _TapBoxBParentState();
}

class _TapBoxBParentState extends State<TapBoxBParent> {
  bool _tapBoxActive = false;

  void _onTap(){
    setState(() {
      _tapBoxActive = !_tapBoxActive;
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: TapBoxB(
        active: _tapBoxActive,
        onTap: _onTap,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({Key? key, required this.active, required this.onTap}) : super(key: key);

  final bool active;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapBoxCParent extends StatefulWidget {
  const TapBoxCParent({Key? key}) : super(key: key);

  @override
  State<TapBoxCParent> createState() => _TapBoxCParentState();
}

class _TapBoxCParentState extends State<TapBoxCParent> {
  bool _isActive = false;

  void onTap(){
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: TapBoxC(active: _isActive, onTap: onTap,),
    );
  }
}

class TapBoxC extends StatefulWidget {
  const TapBoxC({Key? key, required this.active, required this.onTap}) : super(key: key);

  final bool active;
  final void Function() onTap;

  @override
  State<TapBoxC> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void tapDown(_){
    setState(() {
      _highlight = true;
    });
  }

  void tapUp(_){
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: tapDown,
      onTapUp: tapUp,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(
            color: Colors.teal[700]!,
            width: 10.0,
          ) : null,
        ),
      ),
    );
  }
}