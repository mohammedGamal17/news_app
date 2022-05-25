import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final ThemeData light = ThemeData(
    scaffoldBackgroundColor: HexColor('F8F9FA'),
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor('E9ECEF'),
        actionsIconTheme: IconThemeData(
          color: HexColor('212529'),
          size: 20.0,
        ),
        titleTextStyle: TextStyle(
            color: HexColor('212529'),
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
        titleSpacing: 10.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: HexColor('E9ECEF'),
      selectedIconTheme: IconThemeData(color: HexColor('212529'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('ADB5BD'),
      ),
      selectedItemColor: HexColor('212529'),
      selectedLabelStyle: const TextStyle(fontSize: 11.0),
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
        titleSpacing: 10.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('212529'),
      selectedIconTheme: IconThemeData(color: HexColor('f8f9fa'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('6c757d'),
      ),
      selectedItemColor: HexColor('f8f9fa'),
      selectedLabelStyle: const TextStyle(fontSize: 11.0),
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

  final getStorage = GetStorage();
  final darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    getStorage.write(darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return getStorage.read(darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
