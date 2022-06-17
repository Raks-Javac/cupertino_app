import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/constants.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/screens/view_model/view_model.dart';
import 'package:estate_project/src/ui/shared/cupertino_reusables/app_bar.dart';
import 'package:estate_project/src/ui/shared/loaders/network_image_err.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabScreenOne extends StatelessWidget {
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  CupertinoTabScreenOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<CupertinoScreenViewModel>(
      vmBuilder: (context) => CupertinoScreenViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(
      BuildContext context, CupertinoScreenViewModel viewModel) {
    return CupertinoPageScaffold(
        navigationBar: returnCupertinoAppBar("Home"),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: deviceHeight(context) * 0.8,
              ),
              child: Column(
                children: [
                  Image.network(
                    imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return const NetworkImageErrorBuilder();
                    },
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: [
                      UIHelper.horizontalSpaceSmall,
                      const Text("Height(inches)"),
                      UIHelper.horizontalSpaceSmall,
                      Expanded(
                          child: CupertinoTextField(
                              controller: _height,
                              onChanged: (value) {
                                viewModel.updateUserHeight(value);
                              })),
                      UIHelper.horizontalSpaceSmall,
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: [
                      UIHelper.horizontalSpaceSmall,
                      const Text("Weight(kg)"),
                      UIHelper.horizontalSpaceSmall,
                      Expanded(
                          child: CupertinoTextField(
                        controller: _weight,
                        onChanged: (value) {
                          viewModel.updateUserWeight(value);
                        },
                      )),
                      UIHelper.horizontalSpaceSmall,
                    ],
                  ),
                  const Expanded(child: UIHelper.verticalSpaceSmall),
                  CupertinoButton.filled(
                      child: const Text("Calculate BMI"),
                      onPressed: viewModel.buttonStatus
                          ? () {
                              viewModel.calculateBMIResult();
                            }
                          : null),
                  UIHelper.verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ));
  }
}
