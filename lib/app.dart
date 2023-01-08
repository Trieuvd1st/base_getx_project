import 'package:base_getx_project/manage/di.dart';
import 'package:base_getx_project/util/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'build_config.dart';
import 'res/route.dart';
import 'res/style.dart';
import 'util/toast_util.dart';

void runMyApp(Flavor flavor) {
  WidgetsFlutterBinding.ensureInitialized();
  buildConfig.flavor = flavor;
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //_setErrorPage();
    return [
      GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'ja'),
        ],
        theme: Styles.primaryTheme,
        initialRoute: Routes.splash,
        getPages: route,
        onInit: _init,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        enableLog: buildConfig.isDebug,
      ),
      Toast(),
      //GlobalProgressIndicator(),
    ].asStack(textDirection: TextDirection.ltr);
  }

  void _init() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  // void _setErrorPage() {
  //   if (!buildConfig.isDebug) {
  //     ErrorWidget.builder = (FlutterErrorDetails errorDetails) => ErrorPage();
  //   }
  // }
}
