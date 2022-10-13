import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_controllers/my_cart_controller.dart';
import 'package:ui_ux/src/utils/colors.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import 'routes/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    // ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCartController>(create: (_) => MyCartController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          accentColor: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: FontStyles.textTheme,
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
          ),
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: primaryColor,
            textTheme: CupertinoTextThemeData(
              // primaryColor: primaryColor,
              textStyle: FontStyles.normal,
            ),
          ),
        ),
        initialRoute: Pages.INITIAL,
        routes: Pages.routes,
      ),
    );
  }
}
