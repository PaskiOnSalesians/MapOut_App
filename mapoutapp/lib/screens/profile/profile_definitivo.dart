// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/screens/settings/settings.dart';

class ProfileFinalScreen extends StatefulWidget {
  const ProfileFinalScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFinalScreen> createState() => _ProfileFinalScreenState();
}

class _ProfileFinalScreenState extends State<ProfileFinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/ 1.1,
              child: Column(
                children:  [
                  // Information profile
                  const SizedBox(height: 40,),
                  const SettingsButton(),
                  const ProfilePhoto(),
                  const SizedBox(height: 20,),
                  const ActionProfileButtons(),
                  const SizedBox(height: 20,),
                  const SeparatorMain(),
                  const SizedBox(height: 10,),
                  const InterestText(),
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Container(

                      )
                    ],
                  ),
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

class FullNameDisplay extends StatelessWidget {
  const FullNameDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'User Full Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFEB7C25)
          ),
        )
      ],
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              'User Full Name',
              style: TextStyle(
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
        const CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xFF50C3CB),
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