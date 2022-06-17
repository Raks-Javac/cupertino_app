import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estate_project/src/core/services/navigation_services.dart';
import 'package:estate_project/src/core/utils/constants.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/locator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'screens/cupertino_tab_home.dart';

class CupertinoProviderApp extends StatefulWidget {
  final List<SingleChildWidget> multiProvider;
  // ignore: use_key_in_widget_constructors
  const CupertinoProviderApp(this.multiProvider);

  @override
  _CupertinoProviderAppState createState() => _CupertinoProviderAppState();
}

class _CupertinoProviderAppState extends State<CupertinoProviderApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: CupertinoApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DefaultMaterialLocalizations.delegate,
        ],
        color: ColorsTexStyleStore.kAppMainColor,
        navigatorKey: getIt<NavigationService>().navigationKey,
        debugShowCheckedModeBanner: false,
        title: StringsStore.kAppName,
        theme: ThemeHandler.lightMode,
        // home:  const TestApi(),
        home: const CupertinoHomeScreen(),
      ),
    );
  }
}
