import 'package:flutter/material.dart';
import 'package:news_app/screen/splash_screen.dart';
import 'package:news_app/utils/appstate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SpalashScreen(),
      ),
    );
  }
}
