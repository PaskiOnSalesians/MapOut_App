import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/settings/subsettings/help.dart';
import 'package:mapoutapp/screens/settings/subsettings/notifications.dart';
import 'package:mapoutapp/screens/settings/subsettings/security.dart';
import 'package:mapoutapp/widgets/others/separator_section.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileFinalScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF50C3CB),
          ),
        ),
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF50C3CB),
                  radius: 20,
                  child: Icon(
                    Icons.notifications,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Mis notificaciones',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificactionsSettings()));
              },
            ),
          ),
          const SeparatorSection(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF50C3CB),
                  radius: 20,
                  child: Icon(
                    Icons.help,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Ayuda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpScreen()));
              },
            ),
          ), 
          const SeparatorSection(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF50C3CB),
                  radius: 20,
                  child: Icon(
                    Icons.shield,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Seguridad',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecurityScreen()));
              },
            ),
          ), 
          const SeparatorSection(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF50C3CB),
                  radius: 20,
                  child: Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Valora nuestra app',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
              onTap: (){},
            ),
          ), 
          const SeparatorSection(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF50C3CB),
                  radius: 20,
                  child: Icon(
                    Icons.exit_to_app,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
              onTap: (){
                //Provider.of<LoginState>(context).logout();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ),
          const SeparatorSection()
        ]
      ),
    );
  }
}