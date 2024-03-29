import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/settings/settings.dart';
import 'package:mapoutapp/screens/settings/subsettings/change_password.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool isSwitched = false;  
  var textValue = 'Switch is OFF';  

  void toggleSwitch(bool value){
    if(isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
        textValue = 'Switch Button is ON';  
      });  
      //print('Switch Button is ON');  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;  
        textValue = 'Switch Button is OFF';  
      });  
      //print('Switch Button is OFF');  
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF50C3CB),),
        ),
        title: const Text(
          'Seguridad',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        'Cuenta privada',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: toggleSwitch,
                              activeColor: const Color(0xFF50C3CB),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        //color: Colors.grey.withOpacity(0.5),
                        color: Color.fromARGB(113, 130, 130, 130),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Row(
                        children: const [
                          Text(
                            'Cambiar contraseña',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: 100,)
                        ],
                      ),
                    ),
                    onTap: () {
                      try{
                        if(LoginType.accessType == "Email"){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangePassword()));  
                        }
                      } catch(e){
                        Fluttertoast.showToast(msg: 'No puedes cambiar la contraseña a traves de una red social.', backgroundColor: Colors.red, textColor: Colors.white);
                      }
                      
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}