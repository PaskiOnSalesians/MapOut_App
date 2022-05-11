import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/settings/settings.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
          'Ayuda',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                            'Help Center',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                            'Contáctanos',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                            'Política de privacidad',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                            'Licencias',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      )
    );
  }
}