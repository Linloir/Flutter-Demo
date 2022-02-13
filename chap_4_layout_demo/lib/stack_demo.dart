/*
 * @Author       : Linloir
 * @Date         : 2022-02-13 15:29:23
 * @LastEditTime : 2022-02-13 20:42:47
 * @Description  : Stack layout demo page
 */

import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack layout demo page'),
      ),
      body: ConstrainedBox(
        //Note: this is NECCESSARY
        //Otherwise the size of stack will be constrained to the maximum constrained which can be get from the children of the stack
        //which behaves just like row / column
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              constraints: const BoxConstraints.expand(width: 50.0, height: 500.0),
              color: Colors.purple,
            ),
            Positioned(
              left: 10,
              width: 80,
              top: 10,
              height: 80,
              child: Container(
                //Notice: The constraint of THIS container IS OVERWRITTEN by its PARENT,
                //Therefore the constraint will not have an effect on EITHER ITSELF NOR ITS CHILD
                //constraints: const BoxConstraints(maxWidth: 40.0, maxHeight: 40.0),

                //Notice: The alignment here gives a guidence for the alignment of the child of this container
                //If not given, the position of child will be UNSURE
                //which WILL DEFINITELY cause the child filling this container
                alignment: Alignment.center,

                child: Container(
                  //Notice: this constraint here WORKS BOTH on this container ITSELF AND its CHILD
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(maxWidth: 40.0, maxHeight: 40.0), 
                  child: Container(
                    //Notice: the contraint here ONLY set the height
                    //wich proofs that the constraint above has an effect on its child
                    constraints: const BoxConstraints(maxHeight: 20.0),
                    color: Colors.blue
                  ),
                  color: Colors.green,
                ),
                color: Colors.red,
              ),
            ),
            Positioned(
              right: 10,
              width: 80,
              top: 10,
              height: 80,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 10,
              width: 80,
              bottom: 10,
              height: 80,
              child: Container(
                color: Colors.teal,
              ),
            ),
            Positioned(
              right: 10,
              width: 80,
              bottom: 10,
              height: 80,
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
          //Notice: Understand the difference between clip.antialias & clip.antialias by the following links
          //https://github.com/flutter/flutter/issues/18057
          //https://api.flutter.dev/flutter/dart-ui/Canvas/saveLayer.html
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
