import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/search/search.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Chats', style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_chat.png',
                    width: MediaQuery.of(context).size.width / 2
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Text(
                      '¡Aún no tiene chats!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    )
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Text(
                      'Estamos trabajando para habilitar esta herramienta!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    )
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    width: 200,
                    decoration:  BoxDecoration(
                      color: const Color(0xFF50C3CB),
                      border: Border.all(color: const Color(0xFF50C3CB)),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: ListTile(
                      title:  const Text(
                        'BUSCAR PLAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                      },
                    )
                  )
                ],
              ),
            ),
            const Menu()
          ],
        ),
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
          IconButton(onPressed: (){
            
          }, icon: const Icon(Icons.chat_bubble_outline_rounded, color: Color(0xFFEB7C25), size: 35,)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileFinalScreen()));
          }, icon: const Icon(Icons.person_outline, color: Colors.grey, size: 35,))
        ],
      ),
    );
  }
}