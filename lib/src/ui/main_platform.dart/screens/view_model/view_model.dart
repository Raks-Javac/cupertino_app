import 'dart:async';

import 'package:estate_project/src/core/base/base_view_model/b_vm.dart';
import 'package:estate_project/src/core/services/navigation_services.dart';
import 'package:flutter/material.dart';

class CupertinoScreenViewModel extends BaseViewModel {
  final BuildContext? context;
  CupertinoScreenViewModel({this.context});

  startLoadingAndNavigateToNext() {
    changeLoaderStatus(true);
    Future.delayed(const Duration(seconds: 4), () {
      changeLoaderStatus(false);
    });
  }

  navigateBack() {
    popScreen();
  }

  @override
  FutureOr<void> disposeState() {}
  int segMentSate = 0;
  updateSegmanet(int value) {
    segMentSate = value;
    notifyListeners();
  }

  @override
  FutureOr<void> initState() {}
}
