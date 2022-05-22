import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UiColor extends StatelessWidget {
  UiColor({Key? key}) : super(key: key);
  final ThemeData light = ThemeData(
    scaffoldBackgroundColor: HexColor('F8F9FA'),
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor('CED4DA'),
      actionsIconTheme: IconThemeData(
        color: HexColor('212529'),
        size: 20.0,
      ),
      titleTextStyle: TextStyle(
          color: HexColor('212529'),
          fontSize: 18.0,
          fontWeight: FontWeight.bold),
      titleSpacing: 10.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: HexColor('CED4DA'),
      selectedIconTheme: IconThemeData(color: HexColor('212529'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('ADB5BD'),
      ),
      selectedItemColor: HexColor('212529'),
      selectedLabelStyle: const TextStyle(
          fontSize: 11.0
      ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: HexColor('212529'),
      ),
      bodyText1: TextStyle(
        color: HexColor('212529'),
      ),
      caption: TextStyle(
        color: HexColor('ADB5BD'),
      ),
    ),
    iconTheme: IconThemeData(
      color: HexColor('212529'),
    ),
  );
  final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: HexColor('343a40'),
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor('212529'),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      titleTextStyle: TextStyle(
          color: HexColor('F8F9FA'),
          fontSize: 18.0,
          fontWeight: FontWeight.bold),
      titleSpacing: 10.0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('212529'),
      selectedIconTheme: IconThemeData(color: HexColor('f8f9fa'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('6c757d'),
      ),
      selectedItemColor: HexColor('f8f9fa'),
      selectedLabelStyle: const TextStyle(
        fontSize: 11.0
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: HexColor('dee2e6'),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: HexColor('F8F9FA'),
      ),
      bodyText1: TextStyle(
        color: HexColor('F8F9FA'),
      ),
      caption: TextStyle(
        color: HexColor('ADB5BD'),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: HexColor('36BFB1'),
            child: const Text('1'),
            //rgb(232, 249, 253)
          ),
          Container(
            width: double.infinity,
            color: HexColor('038C73'),
            child: const Text('2'),
            //rgb(121, 218, 232)
          ),
          Container(
            width: double.infinity,
            color: HexColor('02735E'),
            child: const Text('3'),
            //rgb(10, 161, 221)
          ),
          Container(
            width: double.infinity,
            color: HexColor('014034'),
            child: const Text('4'),
            //rgb(33, 85, 205)
          ),
          Container(
            width: double.infinity,
            color: HexColor('0D0D0D'),
            child: const Text('5'),
            //rgb(33, 85, 205)
          ),
        ],
      ),
    );
  }
}
