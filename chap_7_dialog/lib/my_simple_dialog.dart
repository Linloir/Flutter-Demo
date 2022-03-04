/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 15:17:38
 * @LastEditTime : 2022-03-04 15:37:23
 * @Description  : simple dialog show
 */

import 'package:flutter/material.dart';

Future<int?> showSimpleDialog({required BuildContext context}) {
  return showDialog<int>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          for(int i = 0; i < 20; i++)
            SimpleDialogOption(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text("Choice $i"),
              ),
              onPressed: () => Navigator.of(context).pop(i),
            ),
          //Proof that the dialog adjust size according to its children
          Container(
            constraints: const BoxConstraints(minWidth: 350),
            child: const Text('test'),
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ],
        title: const Text('Choose'),
      );
    }
  );
}
