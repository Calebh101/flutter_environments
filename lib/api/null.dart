/// Handles cases where imports are unable to use the default import.
/// Contains placeholder and catcher functions.
library;

/// Handles operations that require dart:io.
/// Not supposed to be called, as io is a package utilizing dart:io.
String? io({bool errorOnNotFound = false}) {
  throw Exception(
      "Platforms importing null.dart are not supposed to use io().");
}
