import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/shared/constants.dart';

import 'package:syncfusion_localizations/syncfusion_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        // localizationsDelegates: [SfGlobalLocalizations.delegate],
        // supportedLocales: [
        //   const Locale('pt'),
        // ],
        // locale: const Locale('pt'),
        title: 'UNASP HT',
        theme: ThemeData(
          fontFamily: FONT_FAMILY,
          accentColor: ORANGE,
          primaryColor: BLUE,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginModule(),
      );
}
