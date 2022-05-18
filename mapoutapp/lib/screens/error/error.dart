import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoApp(),
            const SizedBox(height: 50,),
            const Icon(Icons.gpp_maybe, color: Color(0xFF50C3CB),size: 50,),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 225,
                  child: Text(
                    'No hemos podido iniciar sesión!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 100,),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF50C3CB),
                border: Border.all(color: const Color(0xFF50C3CB)),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                title: const Text(
                  'VOLVER A INTENTAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

class LogoApp extends StatelessWidget {
  const LogoApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: MediaQuery.of(context).size.width / 4
    );
  }
}