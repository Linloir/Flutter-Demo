/*
 * @Author       : Linloir
 * @Date         : 2022-03-02 15:15:11
 * @LastEditTime : 2022-03-03 14:54:27
 * @Description  : provider package demo
 */

import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({Key? key, required this.data, required Widget child}) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    return oldWidget.data != data;
  }

  static InheritedProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({Key? key, required this.data, required this.child}) : super(key: key);

  final T data;
  final Widget child;

  @override
  State<ChangeNotifierProvider<T>> createState() => _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void onProviderUpdates() {
    setState(() {
      print('Recieved message');
    });
  }

  @override
  void initState() {
    super.initState();
    widget.data.addListener(onProviderUpdates);
  }

  @override
  void dispose() {
    widget.data.removeListener(onProviderUpdates);
    super.dispose();
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(onProviderUpdates);
      widget.data.addListener(onProviderUpdates);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('Updated inherited provider');
    return InheritedProvider<T>(
      child: widget.child,
      data: widget.data,
    );
  }
}
