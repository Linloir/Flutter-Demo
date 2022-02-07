/*
 * @Author       : Linloir
 * @Date         : 2022-02-07 16:22:59
 * @LastEditTime : 2022-02-07 23:48:29
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
      title: 'Components demo app',
      routes: {
        '/': (context) => const HomePage(),
        '/Text': (context) => const TextPage(),
        '/Buttons': (context) => const ButtonPage(),
        '/Icons': (context) => const IconPage(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(
                'Text',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/Text'),
            ),
            TextButton(
              child: const Text(
                'Button',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/Buttons'),
            ),
            TextButton(
              child: const Text(
                'Icon',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/Icons'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text components'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hello world!',
            ),
            const Text(
              'Hello world!',
              textScaleFactor: 1.2,
            ),
            const Text(
              'Aligning left',
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
            ),
            const Text(
              'Aligning center',
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            const Text(
              'Aligning right',
              textScaleFactor: 1.5,
              textAlign: TextAlign.right,
            ),
            Text(
              'Test textStyle with font family "Corbel"',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.5,
                fontFamily: 'Corbel',
                background: Paint()..color = Colors.teal[100]!,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
                decorationThickness: 1.0,
              ),
            ),
            Text.rich(
              TextSpan(
                children: const [
                  TextSpan(
                    text: 'Homepage:',
                    style: TextStyle(
                      fontSize: 18.0,
                    )
                  ),
                  TextSpan(
                    text: 'https://www.linloir.xyz',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
                style: TextStyle(
                  color: Colors.teal[600]!,
                  height: 2.0,
                  fontSize: 20.0,
                )
              )
            )
          ],
        ),
      ),
    );
  }
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button components'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text('Deprecated Raised button'),
              onPressed: (){},
            ),
            FlatButton(
              child: const Text('Deprecated Flat button'),
              onPressed: (){},
            ),
            OutlineButton(
              child: const Text('Deprecated Outline button'),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: (){},
            ),
            TextButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('Textbutton icon'),
              onPressed: (){},
            ),
            ElevatedButton(
              child: const Text('Elevated button'),
              onPressed: (){},
            ),
            OutlinedButton(
              child: const Text('Outlined button'),
              onPressed: (){},
            ),
            TextButton(
              child: const Text(
                'Submit',
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states){
                  if(states.contains(MaterialState.hovered))
                    return Colors.white.withOpacity(0.10);
                  if(states.contains(MaterialState.focused) || states.contains(MaterialState.pressed))
                    return Colors.white.withOpacity(0.25);
                  return null;
                }),
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0)),
              ),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}

class IconPage extends StatelessWidget {
  const IconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon components'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(
              text: "\uEF9F",
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 30,
                color: Colors.blue[800]?.withOpacity(0.8),
              ),
            )),
            const Icon(Icons.fingerprint, color: Colors.red, size: 30,),
            const Icon(IconData(0xf414, fontFamily: "MaterialIcons"), color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}