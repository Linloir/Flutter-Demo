/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 22:10:34
 * @LastEditTime : 2022-03-04 22:38:31
 * @Description  : Multiple implements of a checkbox dialog
 */

import 'package:flutter/cupertino.dart';
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
    context: context,
  );
}

