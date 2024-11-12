import 'package:flutter/material.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/common/common.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GSB',
      theme: ThemeData(
        primaryColor: ColorStyles.whiteColor,
        scaffoldBackgroundColor: ColorStyles.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorStyles.whiteColor,
        ),
      ),
      home: const AddCarFeesScreen(),
    );
  }
}
