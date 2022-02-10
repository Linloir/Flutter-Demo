/*
 * @Author       : Linloir
 * @Date         : 2022-02-10 14:50:47
 * @LastEditTime : 2022-02-10 20:59:57
 * @Description  : Flow layout demo page
 */

import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  const FlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow layout demo page'),
      ),
      body: Flow(
        delegate: MyFlowDelegate(margin: const EdgeInsets.fromLTRB(5, 2, 5, 2)),
        children: [

        ],
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate{
  final EdgeInsets margin;
  MyFlowDelegate({required this.margin});

  @override
  void paintChildren(FlowPaintingContext context){
    for(int i = 0; i < context.childCount; i++){
      final shift = context.getChildSize(i)
    }
  }

  @override
  Size getSize(BoxConstraints constraints){
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(MyFlowDelegate oldDelegate){
    return margin == oldDelegate.margin;
  }
}
