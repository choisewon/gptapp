import 'package:flutter/material.dart';
import 'package:seproject/constants/Color.dart';
import 'screens/screens.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static bool darkMode = false;
  static int a = 1;

  const MyApp({super.key});


  @override
  MyApp_State createState() => MyApp_State();

  static void ColorType(BuildContext context, Color color) {
    final MyApp_State state = context.findAncestorStateOfType<MyApp_State>()!;
    state.setColor(color);
  }
  // static setDarkMode(bool value){
  //   _darkMode = value;
  // }
}

class MyApp_State extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: background_color_nomal,
        //appBarTheme: AppBarTheme(
          //color: menu_highlite,
        //)
      ),
      home: Screens(),
    );

  }

  void setColor(Color color) {
    setState(() {
      background_color_nomal = color;
    });
  }
}