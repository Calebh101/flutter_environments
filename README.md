# What Is This?

This is a more advanced version of Platform in Flutter for finding and checking the current platform of the app. It includes stuff like desktop mode, mobile mode, native web, and debug mode.

# How to Use

## EnvironmentType

EnvironmentType is an enum of platforms with these possible values:

- `windows`: Windows
- `macos`: macOS
- `linux`: Any Linux distribution
- `ios`: iOS and iPadOS
- `android`: Android
- `web`: Web (WASM or native web)
- `webnative`: Web with native web (For when the platform is web without using WASM)
- `wasm`: Web with WASM
- `fuchsia`: Fuchsia

## Environment

EnvironmentType is a class of platform conditions with these functions and values:

### Values

- `isWindows`: if the platform is Windows
- `isMacos`: if the platform is macOS
- `isLinux`: if the platform is any Linux distribution
- `isIOS`: if the platform is iOS or iPadOS
- `isAndroid`: if the platform is Android
- `isWeb`: if the platform is on the web (WASM or native web)
- `isWasm`: if the platform is web with WASM
- `isWebNative`: if the platform is web with native web (if the platform is web but not WASM)
- `isFuchsia`: if the platform is Fuchsia
- `isDesktop`: if the platform is Windows, macOS, or Linux
- `isMobile`: if the platform is iOS, iPadOS, or Android
- `isApple`: if the platform is iOS, iPadOS or macOS
- `isDebug`: if the project is in debug mode
- `isRelease`: if the projects is in release mode

### Functions

- `format()`
    - Formats a raw EnvironmentType object to proper human-readable format
    - Arguments
        - `platform`: EnvironmentType (required)
            - The platform to be formatted
        - `errorOnNotFound`: boolean (default: true)
            - If the function should error if the platform inputted is not found
- `get()`
    - Gets the current platform as an EnvironmentType

# Extra notes

- This package should be compatible with WASM, but for some reason Pana says it's not.
- I wanted a better name, trust me, but most of the ones I wanted were already taken.