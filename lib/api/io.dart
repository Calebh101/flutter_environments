/// Handles operations that require dart:io.
library;

import 'dart:io';

/// Handles operations that require dart:io.
String? io({bool errorOnNotFound = false}) {
  if (Platform.isAndroid) {
    return "android";
  }
  if (Platform.isIOS) {
    return "ios";
  }
  if (Platform.isLinux) {
    return "linux";
  }
  if (Platform.isMacOS) {
    return "macos";
  }
  if (Platform.isWindows) {
    return "windows";
  }
  if (Platform.isFuchsia) {
    return "fuchsia";
  }
  if (errorOnNotFound) {
    throw Exception("Invalid platform: ${Platform.operatingSystem}");
  }
  return null;
}
