import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/util/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //check the application is web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCYvD75Lop1XihnZscHywBo9dGrFOYOLd8",
            appId: "1:41023812269:web:e1e4d8180a47f32d080c24",
            messagingSenderId: "41023812269",
            projectId: "instagram-clone-b7e6b",
            storageBucket: "instagram-clone-b7e6b.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: SignUpScreen()
        //  ResponsiveLayout(
        //     webScreenLayout: WebScreenlayout(),
        //     mobileScreenLayout: MobileScreenlayout())
        );
  }
}
