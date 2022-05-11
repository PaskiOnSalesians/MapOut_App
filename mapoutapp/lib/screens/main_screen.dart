import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFFEB7C25),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}