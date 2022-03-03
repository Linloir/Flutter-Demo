/*
 * @Author       : Linloir
 * @Date         : 2022-03-02 15:05:36
 * @LastEditTime : 2022-03-03 20:20:34
 * @Description  : 
 */
import 'package:flutter/material.dart';
import './model.dart';
import './provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart demo'),
      ),
      body: const Center(
        child: Cart(),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    print('build called');
    return ChangeNotifierProvider<CartModel>(
      // child: Builder(
      //   builder: (context) {
      //     print('Rebuilt');
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Builder(
      //           builder: (context) {
      //             return Text("The total amount is ${InheritedProvider.of<CartModel>(context)?.data.total}");
      //           },
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: ElevatedButton(
      //             child: const Text('Add item'),
      //             onPressed: () {
      //               InheritedProvider.of<CartModel>(context)?.data.add(const Item(price: 20, count: 1));
      //             },
      //           ),
      //         ),
      //         // Padding(
      //         //   padding: const EdgeInsets.all(10.0),
      //         //   child: ElevatedButton(
      //         //     child: const Text('Reset'),
      //         //     onPressed: () {
      //         //       setState(() {
      //         //         print('Reset');
      //         //       });
      //         //     },
      //         //   ),
      //         // ),
      //       ],
      //     );
      //   },
      // ),
      // data: CartModel(),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Builder(
      //       builder: (context) {
      //         return Text("The total amount is ${InheritedProvider.of<CartModel>(context)?.data.total}");
      //       },
      //     ),
      //     TestRebuildWidget(),
      //     Builder(
      //       builder: (context) {
      //         return Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: ElevatedButton(
      //               child: const Text('Add item'),
      //               onPressed: () {
      //                 InheritedProvider.of<CartModel>(context)?.data.add(const Item(price: 20, count: 1));
      //               }),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      // data: CartModel(),
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("The total amount is ${InheritedProvider.of<CartModel>(context)?.data.total}"),
              TestRebuildWidget(),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      child: const Text('Add item'),
                      onPressed: () {
                        InheritedProvider.of<CartModel>(context)?.data.add(const Item(price: 20, count: 1));
                      }))
            ],
          );
        },
      ),
      data: CartModel(),
    );
  }
}

class TestRebuildWidget extends StatelessWidget {
  const TestRebuildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Rebuilt');
    return const Text('');
  }
}
