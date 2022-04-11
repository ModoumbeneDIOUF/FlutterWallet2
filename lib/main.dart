import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/Splash/splashScreen.dart';
import 'package:nafa_money/lifecycle_manager.dart';
import 'package:nafa_money/localization/demo_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nafa_money/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupLocator();
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SharedPreferences? prefs;

  Locale? _locale;


  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  Widget build(BuildContext context) {

     return LifeCycleManager(
     
       child: ScreenUtilInit(
        designSize: Size(360, 896),
        builder:(){
             return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
     
          locale: _locale ,
          supportedLocales: [
            Locale("en", "US"),
            Locale("fr", "FR"),
          ],
          localizationsDelegates: [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        home: SplashScreen()
         );
        }),
     );
   
  }
}


