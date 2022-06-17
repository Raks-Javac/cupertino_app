import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

displayCupertinoDialog({
  String? dialogTitle,
  String? dialogContent,
  BuildContext? context,
}) async {
  CupertinoAlertDialog _dialog = CupertinoAlertDialog(
    title: Text(dialogTitle!),
    content: Text(dialogContent!),
    actions: [
      CupertinoButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context!);
          })
    ],
  );

  return await showCupertinoDialog(
      context: context!,
      builder: (context) {
        return _dialog;
      });
}
