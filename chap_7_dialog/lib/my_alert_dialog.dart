/*
 * @Author       : Linloir
 * @Date         : 2022-03-04 14:32:34
 * @LastEditTime : 2022-03-04 15:17:20
 * @Description  : Alert Dialog & show func
 */

import 'package:flutter/material.dart';

Future<bool?> showAlertDialog({required BuildContext context}){
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: const Text('Are you sure to delete?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    }
  );
}