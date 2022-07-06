import 'package:flutter/material.dart';
import 'package:velowesalt/core/languages/app_localization_delegate.dart';
import 'package:velowesalt/core/util/route/named_routing.dart';
import 'package:velowesalt/core/util/theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/util/route/general_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  String baseUrl = dotenv.env['baseurl'] as String;
  debugPrint(baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // set up local for finding phone language or selected language
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemData,
      locale: _locale,
      supportedLocales: const [
        Locale('en', "EN"),
        Locale('ar', "AR"),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      routes: GeneralRouter.pages,
      initialRoute: NamedRouting.userPage,
    );
  }
}
