import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/services/auth/login_state.dart';
import 'package:provider/provider.dart';


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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate();
  }

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LoginState>(
      create: (BuildContext context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MapOut',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.nunitoSansTextTheme(),
        ),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);

            if(state.isLoggedIn()){
              return const SearchScreen();
            } else{
              return const Login();
            }
          }
        },
      ),
    );
  }
}