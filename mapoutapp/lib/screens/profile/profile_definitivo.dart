// ignore_for_file: camel_case_types, iterable_contains_unrelated_type

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/screens/settings/settings.dart';
import 'package:mapoutapp/utils/constants/key_constants.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';

class ProfileFinalScreen extends StatefulWidget {
  const ProfileFinalScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFinalScreen> createState() => _ProfileFinalScreenState();
}

String? userId;

class _ProfileFinalScreenState extends State<ProfileFinalScreen> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: SettingsButton(),
          ),
        ],
        toolbarHeight: 80,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/ 1.28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  // Information profile
                  const ProfilePhoto(),
                  const SizedBox(height: 20,),
                  const ActionProfileButtons(),
                  const SizedBox(height: 20,),
                  const SeparatorMain(),
                  const SizedBox(height: 10,),
                  const InterestText(),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: db.collection('ads').snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const Center(child: CircularProgressIndicator());
                        } else{
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: ListView(
                              children: snapshot.data['userid'].docs.map((doc) {
                                return Card(
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),),
                                  child: ListTile(
                                    leading: IconButton(
                                      onPressed: (){
                                        deleteUserSetup(doc.id);
                                      },
                                      icon: const Icon(Icons.done, color: Color(0xFF50C3CB),)
                                    ),
                                    title: Text(
                                      (doc.data() as dynamic)['title'],
                                      style: const TextStyle(
                                        color: Color(0xFF50C3CB),
                                        fontSize: 20
                                      ),
                                    ),
                                    onTap: (){
                                      //eventSetup();
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      }
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const AddNewAction()

                ],
              ),
            ),
            const Menu()
          ],
        ),
      )
    );
  }

  Future<void> deleteUserSetup(String documentName) async{
    CollectionReference ads = FirebaseFirestore.instance.collection('ads');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();

    userId = uid;

    List<dynamic> list = [];

    list.add(uid);

    ads.doc(documentName).update({
      'userid': FieldValue.arrayRemove(list)
    });
    return;
  }
}

class AddNewAction extends StatelessWidget {
  const AddNewAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF50C3CB),
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: ListTile(
        title:  Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
          child: Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.add, color: Color(0xFF50C3CB),size: 32,)
              ),
              SizedBox(width: 20,),
              Text(
                'Añadir nuevo plan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ],
          )
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
        },
      )
    );
  }
}

class SeparatorMain extends StatelessWidget {
  const SeparatorMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.13,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 2,
        color: const Color.fromARGB(113, 198, 198, 198)
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
          }, icon: const Icon(Icons.search, color: Colors.grey, size: 35,)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.grey, size: 35,)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.person_outline, color: Color(0xFFEB7C25), size: 35,))
        ],
      ),
    );
  }
}

class InterestText extends StatelessWidget {
  const InterestText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 23),
          child: Text(
            'MIS PLANES',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
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
          child: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
          }, icon: const Icon(Icons.settings, color: Color(0xFFEB7C25),)),
        ),
        const SizedBox(width: 20,)
      ]
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
  }) : super(key: key);

  String getUsername(){
    if(LoginType.accessType == "Google") {
      return KeyConstants.googleDisplayName;
    } else if(LoginType.accessType == "Facebook"){
      return KeyConstants.facebookUserDataFields["name"];
    }
    return "";
  }

  String getPhotoURL(){
    if(LoginType.accessType == "Google") {
      return KeyConstants.googlePhotoUrl;
    } else if(LoginType.accessType == "Facebook"){
      return KeyConstants.facebookUserDataFields["picture.width(200)"];
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              getUsername(),
              style: const TextStyle(
                color: Color(0xFFEB7C25),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 150,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                title: const Text(
                  'Completa tu perfil',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  
                },
              )
            )
          ],
        ),
        const SizedBox(width: 50,),
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(getPhotoURL()),
          //backgroundColor: Color(0xFF50C3CB),
          //backgroundImage: Image(image: ''),
        )
      ],
    );
  }
}

class ActionProfileButtons extends StatelessWidget {
  const ActionProfileButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.13,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            border: Border.all(color: Colors.transparent),
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
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white, size: 32,),
                        onPressed: (){},
                      )
                    ],
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Modifica tus intereses',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      Text(
                        'Para obtener los planes más adaptados a ti',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}