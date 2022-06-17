import 'package:flutter/cupertino.dart';

returnCupertinoAppBar(String title) {
  return CupertinoNavigationBar(
      middle: Text(
    title,
  ));
}
