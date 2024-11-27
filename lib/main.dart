import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/firebase/firebase_options.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GSB',
        theme: ThemeData(
          primaryColor: AppColors.whiteColor,
          scaffoldBackgroundColor: AppColors.whiteColor,
        ),
        home: const LoginScreen(),
      );
}
