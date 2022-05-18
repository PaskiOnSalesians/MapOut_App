import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/settings/subsettings/security.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String? email;

  @override
  Widget build(BuildContext context) {
    Future resetPassword(String userEmail) async{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail.trim());

      Fluttertoast.showToast(msg: 'Email enviado', textColor: Colors.white, backgroundColor: const Color(0xFF50C3CB));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text('Change password', style: TextStyle(
          color: Colors.black
        )),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF50C3CB),),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecurityScreen()));
          },
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 300,
                  child: Text(
                    'Recibe a traves de email un enlace para cambiar tu contraseña',
                    style: TextStyle(
                      fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 10, 
                  color: const Color(0xFFF0F0F0),
                  style: BorderStyle.solid
                )
              ),
              child: Container(
                color: const Color(0xFFF0F0F0),
                child: SizedBox(
                  child: TextField(
                    onChanged: (value){
                      email = value;
                    }, 
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Email",
                      fillColor: Color(0xFFF0F0F0),
                      prefixIcon: Icon(Icons.mail, color: Color(0xFF50C3CB)),
                      contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                title:  const Text(
                  'RESTABLECER CONTRASEÑA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  resetPassword(email!);
                },
              )
            )
          ],
        )
      ),
    );
  }
}