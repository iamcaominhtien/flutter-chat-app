// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/platforms/mobile/ui/session/login_screen.dart';
import 'package:chat_app/platforms/mobile/ui/user/home_screen.dart';
import 'package:chat_app/services/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:firedart/firedart.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //for windowns
  // Firestore.initialize(DefaultFirebaseOptions.windows.projectId);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        colorScheme: const ColorScheme(
          //for light theme
          primary: Color(0xFF2B3FEC),
          secondary: Colors.blue,
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.blue,
          onBackground: Color(0xFF182C4E),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.black,
          secondary: Color(0xFF16171B),
          surface: Color(0xFF5852D6),
          background: Color(0xFF20232B),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      home: Helper.checkAuthStatus() ? const HomeScreen() : const LoginScreen(),
    );
  }
}
