// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/settings/settings.dart';
import 'package:mapoutapp/widgets/others/separator_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: const [
            // Information profile
            SizedBox(height: 30,),
            SettingsButton(),
            ProfilePhoto(),
            SizedBox(height: 20,),
            FullNameDisplay(),
            SizedBox(height: 20,),
            ActionProfileButtons(),
            SizedBox(height: 20,),
            SeparatorSection(),
            SizedBox(height: 10,),
          
            // Under Section
            Column_Interests_ShareFriends(),
            
            SizedBox(height: 20,),
            SeparatorSection(),
            SizedBox(height: 10,),
            BuildVersion(),


            //FloatingMenu()
          ],
        ),
      )
    );
  }
}

class BuildVersion extends StatelessWidget {
  const BuildVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('VERSIÓN 0.5', style: TextStyle(
          color: Color.fromARGB(255, 198, 198, 198),
          fontWeight: FontWeight.bold
        ),)
      ],
    );
  }
}

class Column_Interests_ShareFriends extends StatelessWidget {
  const Column_Interests_ShareFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        children:  [
          const InterestText(),
          const SizedBox(height: 10,),
          const IntrerestsSection(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: const Color.fromARGB(113, 198, 198, 198)
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // Second section
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 75,
            decoration: BoxDecoration(
              color:  const Color(0xFF50C3CB),
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined, color: Colors.white, size: 40,),
              label: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '¡INVITA A TUS AMIGOS!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          )
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
        Text(
          'INTERESES',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

class IntrerestsSection extends StatelessWidget {
  const IntrerestsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: const Color(0xFFEB7C25),
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 120, 0),
                    child: Text(
                      'Marca tus intereses que más acordes sean a ti!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Modifica tus intereses',
                        style: TextStyle(
                          color: Color(0xFFEB7C25),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      )
                    )
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            )
          ],
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
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
        }, icon: const Icon(Icons.settings, color: Color(0xFFEB7C25),))
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
            fontWeight: FontWeight.bold
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
      children: const [
        CircleAvatar(
          radius: 60,
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
        SizedBox(
          width: 170,
          child: Column(
            children: [
              Container(
                width: 170,
                decoration: BoxDecoration(
                  color: const Color(0xFF50C3CB),
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: TextButton(
                  onPressed: (){},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Text(
                      '¿Quieres añadir una bio a tu perfil?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
        SizedBox(
          width: 170,
          child: Column(
            children: [
              Container(
                width: 170,
                decoration: BoxDecoration(
                  color: const Color(0xFFEB7C25),
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: TextButton(
                  onPressed: (){},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 11, 10, 11),
                    child: Text(
                      '¿De dónde eres?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}