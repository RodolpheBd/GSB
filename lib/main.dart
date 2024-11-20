import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/common/common.dart';

void main() async => (() async => {
      WidgetsFlutterBinding.ensureInitialized(),
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      runApp(MyApp()),
    })();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GSB',
        theme: ThemeData(
          primaryColor: ColorStyles.whiteColor,
          scaffoldBackgroundColor: ColorStyles.whiteColor,
        ),
        home: const LoginScreen(),
      );
}