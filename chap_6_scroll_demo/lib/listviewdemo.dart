/*
 * @Author       : Linloir
 * @Date         : 2022-02-17 17:52:39
 * @LastEditTime : 2022-02-18 11:25:24
 * @Description  : 
 */
/*
 * @Author       : Linloir
 * @Date         : 2022-02-17 17:52:39
 * @LastEditTime : 2022-02-17 17:52:39
 * @Description  : List View Demo Page
 */

import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Demo Page'),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text('${index + 1} of 100'),
              subtitle: Text('this is a subtitle'),
              //onTap: (){},
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return Divider(
              indent: 15.0,
              endIndent: 15.0,
            );
          },
        ),
      ),
    );
  }
}
