import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Column(
              children: const [

              ],
            ),
            const Menu()
          ],
        )
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
            
          }, icon: const Icon(Icons.search, color: Color(0xFFEB7C25), size: 35,)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){
            
          }, icon: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.grey, size: 35,)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileFinalScreen()));
          }, icon: const Icon(Icons.person_outline, color: Colors.grey, size: 35,))
        ],
      ),
    );
  }
}