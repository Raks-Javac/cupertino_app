import 'package:flutter/material.dart';

class NetworkImageErrorBuilder extends StatelessWidget {
  const NetworkImageErrorBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40.0),
      child: Center(
          child: Text(
        "Currently can't load image. \n Kindly check your internt connection.",
        textAlign: TextAlign.center,
      )),
    );
  }
}
