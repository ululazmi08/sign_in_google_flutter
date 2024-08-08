import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hi_bank/constant/colors.dart';
import 'package:test_hi_bank/controller/auth_controller.dart';
import 'package:test_hi_bank/page/home_page.dart';
import 'package:test_hi_bank/page/login_page.dart';
import 'package:test_hi_bank/routes/pages_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCVbJPhYPqBEoXdP9bJZhGKfZAl8-mofqs",
      authDomain: "test-hibank.firebaseapp.com",
      projectId: "test-hibank",
      storageBucket: "test-hibank.appspot.com",
      messagingSenderId: "509011285905",
      appId: "1:509011285905:web:ff3d2d89f307ab322aac30",
    ),
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: PagesRoute.pages,
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(
          milliseconds: 1500),),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kColorOrange,
              ),
            ),
          );
        } else {
          return AuthController.instance.isLoggedIn()
              ? HomePage()
              : const LoginPage();
        }
      },
    );
  }
}
