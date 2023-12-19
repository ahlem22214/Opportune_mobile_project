//import 'Home_Page.dart'; // Import your home page file
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App Title',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       //home: HomePage(isUser: true), // Adjust the value of isUser as needed
//       home: HomePage(isUser: true), // Adjust the value of isUser as needed
//
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'Company_Home.dart';
import 'Home_Page.dart';
import 'Landing_Page.dart';
import 'SigninScreen.dart';
import 'SignupWidget.dart';
import 'jobList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:'/landing',
      routes: {
        '/landing': (context) => FirstPage(),
        '/signin': (context) => SigninScreen(),
        '/signup': (context) => SignupWidget(),
        '/hr_signup': (context) => HrRepresentativeSignupScreen(),
        '/job_seeker_signup': (context) => JobSeekerSignupScreen(),
        '/home': (context) => HomePage(isUser:true),
        '/company_home': (context) => JobList(),
      },
    );
  }
}





