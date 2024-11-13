// lib/utils/screen_utils.dart
import 'package:flutter/material.dart';

/// Utility functions for screen-related operations
class ScreenUtils {
  /// Returns true if the screen width is >= 600dp (tablet/desktop)
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  /// Returns the screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns true if the device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Returns true if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }
}

/// Extension methods for BuildContext
extension BuildContextExtension on BuildContext {
  /// Returns the screen's padding
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Returns the screen's view insets
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Returns the screen's size
  Size get screenSize => MediaQuery.of(this).size;

  /// Shows a snackbar with the given message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
