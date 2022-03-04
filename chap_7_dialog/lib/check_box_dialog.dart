/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 22:10:34
 * @LastEditTime : 2022-03-04 23:09:48
 * @Description  : Multiple implements of a checkbox dialog
 */

import 'package:flutter/material.dart';

class StatefulCheckBox extends StatefulWidget {
  const StatefulCheckBox({Key? key, required this.onChanged}) : super(key: key);

  final void Function(bool?) onChanged;

  @override
  State<StatefulCheckBox> createState() => _StatefulCheckBoxState();
}

class _StatefulCheckBoxState extends State<StatefulCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      onChanged: (value) => setState(() {
        widget.onChanged(value);
        checked = value ?? false;
      }),
    );
  }
}

Future <bool?> showCheckBoxDialog1({required BuildContext context}) {
  bool checked = false;

  return showDialog<bool>(
    context: context,
    // IMPORTANT NOTE!!!
    // The context here IS NOT the one above !!!!!!!!!!
    // It's the captured parameter of the closure !!!!!
    // Which should be THE CONTEXT OF WHERE THE CLOSURE IS CALLED
    // which should be THE ROOT CONTEXT OF THE DIALOG
    // AGAIN, IT'S !!!NOT!!! THE SAME CONTEXT AS THE ONE PASSING TO THE PARENT FUNCTION!!!!!!!
    builder: (context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure to delete current file / folder ?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Delete recursively'),
                StatefulCheckBox(
                  onChanged: (value) {
                    checked = value ?? false;
                  },
                ),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () => Navigator.of(context).pop(checked),
          )
        ],
      );
    },
  );
}

Future<bool?> showCheckBoxDialog2({required BuildContext context}) {
  bool checked = false;
  return showDialog(
    context: context,
    // IMPORTANT NOTE!!!
    // The context here IS NOT the one above !!!!!!!!!!
    // It's the captured parameter of the closure !!!!!
    // Which should be THE CONTEXT OF WHERE THE CLOSURE IS CALLED
    // which should be THE ROOT CONTEXT OF THE DIALOG
    // AGAIN, IT'S !!!NOT!!! THE SAME CONTEXT AS THE ONE PASSING TO THE PARENT FUNCTION!!!!!!!
    builder: (context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text('Are you sure to delete current file / folder ?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text('Delete recursively'),
                ),
                StatefulBuilder(
                  builder: (context, _setState) {
                    return Checkbox(
                      value: checked,
                      onChanged: (value) {
                        _setState((){
                          checked = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () => Navigator.of(context).pop(checked),
          )
        ],
      );
    }
  );
}

Future<bool?> showCheckBoxDialog3({required BuildContext context}) {
  bool checked = false;
  return showDialog(
    context: context,
    // IMPORTANT NOTE!!!
    // The context here IS NOT the one above !!!!!!!!!!
    // It's the captured parameter of the closure !!!!!
    // Which should be THE CONTEXT OF WHERE THE CLOSURE IS CALLED
    // which should be THE ROOT CONTEXT OF THE DIALOG
    // AGAIN, IT'S !!!NOT!!! THE SAME CONTEXT AS THE ONE PASSING TO THE PARENT FUNCTION!!!!!!!
    builder: (context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text('Are you sure to delete current file / folder ?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text('Delete recursively'),
                ),
                Builder(
                  builder: (context) {
                    return Checkbox(
                      value: checked,
                      onChanged: (value) {
                        checked = value ?? false;
                        (context as Element).markNeedsBuild();
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () => Navigator.of(context).pop(checked),
          )
        ],
      );
    }
  );
}