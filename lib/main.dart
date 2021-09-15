
import 'package:cryptodemo/screens/my_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textSize = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          headline4: textSize.headline4!.copyWith(
            color: Colors.white,
          ),
          headline5: textSize.headline5!.copyWith(color: Colors.white),
          headline6: textSize.headline6!.copyWith(
            color: Colors.white,
          ),
          subtitle1: textSize.subtitle1!.copyWith(
            color: Colors.white,
          ),
          subtitle2: textSize.subtitle2!.copyWith(
            color: Colors.grey,
          ),
          overline: textSize.overline!.copyWith(color: Colors.grey),
        ),
      ),
        themeMode: ThemeMode.dark,
      home: MyHomeScreen()
    );
  }
}

