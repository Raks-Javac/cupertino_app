import 'dart:async';
import 'dart:developer';

import 'package:estate_project/src/core/base/base_view_model/b_vm.dart';
import 'package:estate_project/src/core/services/navigation_services.dart';
import 'package:estate_project/src/ui/shared/cupertino_reusables/dialog.dart';
import 'package:flutter/cupertino.dart';
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

  //fpr the cupertinosegmented
  int segMentSate = 0;
  updateSegmanet(int value) {
    segMentSate = value;
    notifyListeners();
  }

//calculate bmi

  double bmiFormula(double height, double weight) {
    double _result = (weight * 703) / (height * height);
    return _result;
  }

  bool buttonStatus = false;
  enableButton(bool fieldsFilled) {
    buttonStatus = fieldsFilled;
    notifyListeners();
  }

  checkFieldsStats() {
    if (userweight == "" || userweight == "") {
      enableButton(false);
    } else {
      enableButton(true);
    }
    notifyListeners();

    log("$userheight and $userweight and $buttonStatus");
  }

  String userheight = "";
  String userweight = "";

  updateUserHeight(String height) {
    userheight = height;
    checkFieldsStats();
    notifyListeners();
  }

  updateUserWeight(String weight) {
    userweight = weight;
    checkFieldsStats();
    notifyListeners();
  }

  calculateBMIResult() {
    double _height = double.tryParse(userheight) ?? 0;
    double _weight = double.tryParse(userweight) ?? 0;
    double _bmiResult = bmiFormula(_height, _weight);
    String _resultDisplayed = _bmiResult.toStringAsFixed(2);

    displayCupertinoDialog(
      dialogTitle: "BMI Calculator",
      dialogContent: "The result of BMI is $_resultDisplayed kg/m2",
      context: context,
    );
  }

  @override
  FutureOr<void> initState() {}
}
