import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malluwall/view/catagoryscreen.dart';
import 'package:malluwall/view/download_screen.dart';
import 'package:malluwall/view/home_screen.dart';
import 'package:malluwall/view/splash_screen.dart';
import 'package:malluwall/view/wallpaper_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/cat',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/home', page: () => HomeView()),
          GetPage(name: '/wall', page: () => SelectedWall()),
          GetPage(name: '/setwall', page: () => DowloadScreen()),
                    GetPage(name: '/cat', page: () => CatScreen()),


        ]);
  }
}
