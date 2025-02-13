import 'dart:io';
import 'package:flutter/foundation.dart';

/// Enum for environment types, like Windows, macOS, Android, etcetera.
/// WebNative: when the platform is web without using WASM.
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

  /// Web (WASM or WebNative)
  web,

  /// Web with WebNative
  /// For when the platform is web without using WASM
  webnative,

  /// Web with WASM
  wasm,

  /// Fuchsia
  fuchsia,
}

/// Class for environment conditions, like is it Windows, is it Desktop, is it debug mode, etcetera
class Environment {
  /// Builder for Environment
  Environment();

  /// True if the platform is Windows
  static bool get isWindows => _is('windows');

  /// True if the platform is macOS
  static bool get isMacos => _is('macos');

  /// True if the platform is any Linux distribution
  static bool get isLinux => _is('linux');

  /// True if the platform is iOS or iPadOS
  static bool get isIOS => _is('ios');

  /// True if the platform is Android
  static bool get isAndroid => _is('android');

  /// True if the platform is on the web (WASM or WebNative)
  static bool get isWeb => _is('web');

  /// True if the platform is web with WASM
  static bool get isWasm => _is('wasm');

  /// True if the platform is Fuchsia
  static bool get isFuchsia => _is('fuchsia');

  /// True if the platform is Windows, macOS, or Linux
  static bool get isDesktop => _is('windows') || _is('macos') || _is('linux');

  /// True if the platform is iOS, iPadOS, or Android
  static bool get isMobile => _is('ios') || _is('android');

  /// True if the platform is web with WebNative (web without WASM)
  static bool get isWebNative => _is('web') && !_is('wasm');

  /// True if the project is in debug mode
  static bool get isDebug => _debug();

  /// True if the project is in release mode (not debug mode)
  static bool get isRelease => !_debug();

  static bool _is(String platform) {
    return _getString() == platform;
  }

  static String _get(String input) {
    return input;
  }

  /// Format a raw Environment string to proper human-readable format
  static String format(String platform, {bool errorOnNotFound = true}) {
    switch (platform) {
      case 'web':
        return 'Web';
      case 'wasm':
        return 'WASM';
      case 'webnative':
        return 'WebNative';
      case 'android':
        return 'Android';
      case 'ios':
        return 'iOS';
      case 'linux':
        return 'Linux';
      case 'macos':
        return 'macOS';
      case 'windows':
        return 'Windows';
      case 'fuchsia':
        return 'Fuchsia';
      case 'desktop':
        return 'Desktop';
      case 'mobile':
        return 'Mobile';
      case 'online':
        return 'Online';
      case 'debug':
        return 'Debug';
      default:
        if (errorOnNotFound == false) {
          return platform;
        }
        throw Exception('Unknown platform: $platform');
    }
  }

  static EnvironmentType _getObject(String platform) {
    platform = format(platform, errorOnNotFound: false);
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

  static String _getString() {
    if (kIsWeb) {
      return _get("web");
    }
    if (kIsWasm) {
      return _get("wasm");
    }
    if (Platform.isAndroid) {
      return _get("android");
    }
    if (Platform.isIOS) {
      return _get("ios");
    }
    if (Platform.isLinux) {
      return _get("linux");
    }
    if (Platform.isMacOS) {
      return _get("macos");
    }
    if (Platform.isWindows) {
      return _get("windows");
    }
    if (Platform.isFuchsia) {
      return _get("fuchsia");
    }
    return _get('unknown');
  }
}
