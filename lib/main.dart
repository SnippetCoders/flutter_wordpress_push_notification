import 'package:flutter/material.dart';

import 'home_page.dart';
import 'globals.dart' as globals;

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Push Notification',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: globals.appNavigator,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
