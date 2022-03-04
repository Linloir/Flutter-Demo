/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 10:38:09
 * @LastEditTime : 2022-03-04 23:10:09
 * @Description  : 
 */
import 'package:flutter/material.dart';
import './my_alert_dialog.dart';
import './my_simple_dialog.dart';
import './check_box_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lastChoice = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Alert Dialog'),
                onPressed: () async {
                  var delete = await showAlertDialog(context: context);
                  if(delete != null && delete == true){
                    setState((){
                      lastChoice = "Delete";
                    });
                  }
                  else{
                    setState((){
                      lastChoice = "Cancelled";
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Simple Dialog'),
                onPressed: () async {
                  var choice = await showSimpleDialog(context: context);
                  if(choice != null){
                    setState((){
                      lastChoice = "Last chose $choice";
                    });
                  }
                  else{
                    setState((){
                      lastChoice = "Cancelled";
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Check box dialog (1)'),
                onPressed: () async {
                  var choice = await showCheckBoxDialog1(context: context);
                  if(choice != null){
                    setState((){
                      lastChoice = "Last chose $choice";
                    });
                  }
                  else{
                    setState((){
                      lastChoice = "Cancelled";
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Check box dialog (2)'),
                onPressed: () async {
                  var choice = await showCheckBoxDialog2(context: context);
                  if(choice != null){
                    setState((){
                      lastChoice = "Last chose $choice";
                    });
                  }
                  else{
                    setState((){
                      lastChoice = "Cancelled";
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Check box dialog (3)'),
                onPressed: () async {
                  var choice = await showCheckBoxDialog2(context: context);
                  if(choice != null){
                    setState((){
                      lastChoice = "Last chose $choice";
                    });
                  }
                  else{
                    setState((){
                      lastChoice = "Cancelled";
                    });
                  }
                },
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(lastChoice),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
