/*
 * @Author       : Linloir
 * @Date         : 2022-02-10 14:50:47
 * @LastEditTime : 2022-02-13 00:11:33
 * @Description  : Flow layout demo page
 */

import 'dart:math';

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
          Container(width: 80.0, height: 80.0, color: Colors.red,),
          Container(width: 80.0, height: 80.0, color: Colors.blue,),
          Container(width: 80.0, height: 80.0, color: Colors.green,),
          Container(width: 80.0, height: 80.0, color: Colors.purple,),
          Container(width: 80.0, height: 80.0, color: Colors.teal,),
          Container(width: 80.0, height: 80.0, color: Colors.pink,),
          Container(width: 80.0, height: 80.0, color: Colors.red,),
          Container(width: 80.0, height: 80.0, color: Colors.blue,),
          Container(width: 80.0, height: 80.0, color: Colors.green,),
          Container(width: 80.0, height: 80.0, color: Colors.purple,),
          Container(width: 80.0, height: 80.0, color: Colors.teal,),
          Container(width: 80.0, height: 80.0, color: Colors.pink,),
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
    var xShift = margin.left;
    var yShift = margin.top;
    var curMaxHeight = 0.0;
    for(int i = 0; i < context.childCount; i++){
      //Judge if current row is full
      var curRightBorder = xShift + context.getChildSize(i)!.width + margin.left + margin.right;
      //If current row is not full, calculate shifts and paint child
      if(curRightBorder < context.size.width){
        context.paintChild(i,
          transform: Matrix4.translationValues(xShift + margin.left, yShift + margin.top, 0.0),
        );
        xShift = curRightBorder;
        curMaxHeight = max(curMaxHeight, context.getChildSize(i)!.height);
      }
      else{
        xShift = margin.left;
        yShift = yShift + curMaxHeight + margin.top + margin.bottom;
        context.paintChild(i,
          transform: Matrix4.translationValues(xShift + margin.left, yShift + margin.top, 0.0),
        );
        xShift = xShift + context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints){
    return const Size(double.infinity, 400.0);
  }

  @override
  bool shouldRepaint(MyFlowDelegate oldDelegate){
    return margin == oldDelegate.margin;
  }
}
