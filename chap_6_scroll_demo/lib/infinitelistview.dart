/*
 * @Author       : Linloir
 * @Date         : 2022-02-18 11:47:17
 * @LastEditTime : 2022-02-18 15:51:51
 * @Description  : Infinite List View
 */

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfListViewPage extends StatefulWidget {
  const InfListViewPage({Key? key}) : super(key: key);

  @override
  State<InfListViewPage> createState() => _InfListViewPageState();
}

class _InfListViewPageState extends State<InfListViewPage> {
  List<String> buffer = ['#end'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite List View Demo'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: buffer.length,
        itemBuilder: (context, index) {
          if(index == buffer.length - 1){
            if(buffer.length >= 100){
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  'No more words',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            }
            else{
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                )
              );
            }
          }
          else{
            return ListTile(
              title: Text(buffer[index]),
            );
          }
        },
      ),
    );
  }

  void _retrieveData(){
    Future.delayed(Duration(seconds: 2)).then(
      (e){
        setState(() {
          buffer.insertAll(
            buffer.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
          );
        });
      }
    );
  }
}
