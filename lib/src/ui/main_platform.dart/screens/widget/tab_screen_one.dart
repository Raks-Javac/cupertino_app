import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/screens/view_model/view_model.dart';
import 'package:estate_project/src/ui/shared/loaders/network_image_err.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String imageUrl = "https://bit.ly/3MVXeap";

class CupertinoTabScreenOne extends StatelessWidget {
  const CupertinoTabScreenOne({Key? key}) : super(key: key);
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
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Home",
          ),
        ),
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
                    children: const [
                      UIHelper.horizontalSpaceSmall,
                      Text("Height"),
                      UIHelper.horizontalSpaceSmall,
                      Expanded(child: CupertinoTextField()),
                      UIHelper.horizontalSpaceSmall,
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: const [
                      UIHelper.horizontalSpaceSmall,
                      Text("Weight"),
                      UIHelper.horizontalSpaceSmall,
                      Expanded(child: CupertinoTextField()),
                      UIHelper.horizontalSpaceSmall,
                    ],
                  ),
                  const Expanded(child: UIHelper.verticalSpaceSmall),
                  CupertinoButton.filled(
                      child: const Text("Calculate"), onPressed: () {}),
                  UIHelper.verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ));
  }
}
