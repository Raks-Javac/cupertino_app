import 'package:estate_project/src/core/base/base_view/b_view.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/ui/main_platform.dart/screens/view_model/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoHomeScreen extends StatelessWidget {
  const CupertinoHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<CupertinoScreenViewModel>(
      vmBuilder: (context) => CupertinoScreenViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(
      BuildContext context, CupertinoScreenViewModel viewModel) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                size: screenAwareSize(35, context),
              ),
              label: "Me"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings,
                size: screenAwareSize(35, context),
              ),
              label: "Settings"),
        ]),
        tabBuilder: (context, index) {
          return Container();
        });
  }
}
