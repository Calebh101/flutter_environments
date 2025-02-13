import 'package:flutter/material.dart';
import 'package:flutter_environments/flutter_environments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Environments Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Environments Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  print("Current platform: ${Environment.get()}");
                },
                child: Text("Print current platform")),
            TextButton(
                onPressed: () {
                  print(
                      "Current platform: ${Environment.format(Environment.get())}");
                },
                child: Text("Format current platform")),
            TextButton(
                onPressed: () {
                  print("Is Windows: ${Environment.isWindows}");
                  print("Is macOS: ${Environment.isMacos}");
                  print("Is Linux: ${Environment.isLinux}");
                  print("Is iOS/iPadOS: ${Environment.isIOS}");
                  print("Is Android: ${Environment.isAndroid}");
                  print("Is Fuchsia: ${Environment.isFuchsia}");
                  print(
                      "Is web: ${Environment.isWeb} (WASM: ${Environment.isWasm}) (WebNative: ${Environment.isWebNative})");
                  print("Is desktop: ${Environment.isDesktop}");
                  print("Is mobile: ${Environment.isMobile}");
                  print("Is debug: ${Environment.isDebug}");
                  print("Is release: ${Environment.isRelease}");
                },
                child: Text("Print platform stats")),
          ],
        ),
      ),
    );
  }
}
