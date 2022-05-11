import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapoutapp/screens/profile/profile.dart';


/*
 *    @Author: Pasqual Peñalver aka DevPaski
 *    @Description: MapOut App
 *    @Details: In this development there were more members.
 *              Furthermore one of the 2 developers made 
 *              all the work (DevPaski).
 *              
 *              The logo and some designs are the only creation 
 *              not made by DevPaski.
 */

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapOut',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      home: const ProfileScreen(),
    );
  }
}