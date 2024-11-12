import 'package:flutter/material.dart';
import 'package:gsb/src/modules/add_fees/car_fees_screen.dart';
import 'package:gsb/src/common/common.dart';
import 'src/modules/login/login_screen.dart';

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