import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppColors extends ChangeNotifier {
  static late Box<bool> _themeBox;

  static bool get isDarkMode =>
      _themeBox.get('isDarkMode', defaultValue: true) ?? true;

  static Color get dark =>
      isDarkMode ? Color.fromARGB(255, 17, 17, 17) : Colors.white;
  static Color get white =>
      isDarkMode ? Colors.white : Color.fromARGB(255, 17, 17, 17);
  static Color get veryLightGray =>
      isDarkMode ? Color(0xFFF6F6F6) : Color.fromARGB(255, 28, 28, 28);
  static Color get grey =>
      isDarkMode ? Color(0xFF9A989A) : Color.fromARGB(255, 114, 114, 114);
  static Color get lightGray =>
      isDarkMode ? Color(0xFFCCCCCC) : Color.fromARGB(255, 35, 35, 35);
  static Color get darkGray =>
      isDarkMode ? Color(0xFF333333) : Color(0xFFCCCCCC);
  static Color get brightTealGreen =>
      Color(0xFF0BE9A6); // This color remains the same
  static Color get softPurple =>
      isDarkMode ? Color(0xFFB5A2CA) : Color(0xFF4A3D5A);
  static Color get purple =>
      isDarkMode ? Color.fromARGB(255, 88, 50, 126) : Color(0xFFB5A2CA);
  static Color get brightPurple =>
      Color(0xFF7D00D0); // This color remains the same
  static Color get veryDarkPurple =>
      isDarkMode ? Color(0xFF0D0712) : Color.fromARGB(255, 155, 62, 255);

  static void toggleTheme() {
    _themeBox.put('isDarkMode', !isDarkMode);
  }

  static Future<void> loadTheme() async {
    _themeBox = await Hive.openBox<bool>('themeBox');
  }

  static void setDarkMode() {
    _themeBox.put('isDarkMode', true);
  }
}
