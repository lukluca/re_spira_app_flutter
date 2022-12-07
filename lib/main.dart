import 'package:flutter/material.dart';
import 'package:re_spira_app_flutter/landscape_locker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'StartPage/start_page.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    landscapeModeOnly();

    return MaterialApp(
      title: 're_spira',
      theme: ThemeData(
        primarySwatch: accentColor,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const StartPage(),
    );
  }
}
