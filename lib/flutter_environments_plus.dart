/// Base library for managing everything for flutter_environments.
library;

import 'package:flutter/foundation.dart';
import 'api/io.dart' if (dart.library.html) 'api/null.dart';

/// Enum for environment types, like Windows, macOS, Android, etcetera.
///
/// [EnvironmentType.webnative]: when the platform is web without using WASM.
enum EnvironmentType {
  /// Windows
  windows,

  /// macOS
  macos,

  /// Any Linux distribution
  linux,

  /// iOS and iPadOS
  ios,

  /// Android
  android,

  /// Web (WASM or native web)
  web,

  /// Web with native web
  ///
  /// For when the platform is web without using WASM.
  webnative,

  /// Web with WASM
  wasm,

  /// Fuchsia
  fuchsia,
}

/// Class for environment conditions, like is it Windows, is it Desktop, is it debug mode, etcetera
class Environment {
  Environment._();

  /// True if the platform is Windows.
  static bool get isWindows => _is('windows');

  /// True if the platform is macOS.
  static bool get isMacos => _is('macos');

  /// True if the platform is any Linux distribution.
  static bool get isLinux => _is('linux');

  /// True if the platform is iOS or iPadOS.
  static bool get isIOS => _is('ios');

  /// True if the platform is Android.
  static bool get isAndroid => _is('android');

  /// True if the platform is on the web (WASM or native web).
  static bool get isWeb => _is('web');

  /// True if the platform is web with WASM.
  static bool get isWasm => _is('wasm');

  /// True if the platform is Fuchsia.
  static bool get isFuchsia => _is('fuchsia');

  /// True if the platform is Windows, macOS, or Linux.
  static bool get isDesktop => _is('windows') || _is('macos') || _is('linux');

  /// True if the platform is iOS, iPadOS, or Android.
  static bool get isMobile => _is('ios') || _is('android');

  /// True if the platform is iOS, iPadOS, or macOS.
  static bool get isApple => _is('ios') || _is('macos');

  /// True if the platform is web with native web (web without WASM).
  static bool get isWebNative => _is('web') && !_is('wasm');

  /// True if the project is in debug mode
  static bool get isDebug => _debug();

  /// True if the project is in release mode (not debug mode)
  static bool get isRelease => !_debug();

  static bool _is(String platform) {
    return _getString() == platform;
  }

  /// Format an EnvironmentType object to proper human-readable format
  static String format(EnvironmentType platform,
      {bool errorOnNotFound = true}) {
    switch (platform) {
      case EnvironmentType.web:
        return 'Web';
      case EnvironmentType.wasm:
        return 'WASM';
      case EnvironmentType.webnative:
        return 'Native Web';
      case EnvironmentType.android:
        return 'Android';
      case EnvironmentType.ios:
        return 'iOS';
      case EnvironmentType.linux:
        return 'Linux';
      case EnvironmentType.macos:
        return 'macOS';
      case EnvironmentType.windows:
        return 'Windows';
      case EnvironmentType.fuchsia:
        return 'Fuchsia';
    }
  }

  static EnvironmentType _getObject(String platform) {
    switch (platform) {
      case 'web':
        return EnvironmentType.web;
      case 'wasm':
        return EnvironmentType.wasm;
      case 'android':
        return EnvironmentType.android;
      case 'ios':
        return EnvironmentType.ios;
      case 'linux':
        return EnvironmentType.linux;
      case 'macos':
        return EnvironmentType.macos;
      case 'windows':
        return EnvironmentType.windows;
      case 'fuchsia':
        return EnvironmentType.fuchsia;
      case 'webnative':
        return EnvironmentType.webnative;
      default:
        throw Exception('Unknown platform: $platform');
    }
  }

  static bool _debug() {
    return kDebugMode;
  }

  /// For getting the current EnvironmentType
  static EnvironmentType get() {
    return _getObject(_getString());
  }

  @override
  String toString() {
    return "Environment(${get()})";
  }

  static String _getString() {
    if (kIsWeb) return "web";
    if (kIsWasm) return "wasm";
    return io() ?? 'unknown';
  }
}
