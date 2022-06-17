import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/constants.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/screens/view_model/view_model.dart';
import 'package:estate_project/src/ui/shared/cupertino_reusables/app_bar.dart';
import 'package:estate_project/src/ui/shared/loaders/network_image_err.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CupertinoTabScreenTwo extends StatelessWidget {
  const CupertinoTabScreenTwo({Key? key}) : super(key: key);
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
        navigationBar: returnCupertinoAppBar("Settings"),
        child: SafeArea(
            child: Column(children: [
          Image.network(
            settingsImageUrl,
            errorBuilder: (context, error, stackTrace) {
              return const NetworkImageErrorBuilder();
            },
          ),
          UIHelper.verticalSpaceMedium,
          SizedBox(
            width: deviceWidth(context),
            child: CupertinoSegmentedControl(
                children: children(context),
                groupValue: viewModel.segMentSate,
                onValueChanged: (int value) {
                  viewModel.updateSegmanet(value);
                }),
          ),
        ])));
  }
}
