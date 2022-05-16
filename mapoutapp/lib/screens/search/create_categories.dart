import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/search/create_activity.dart';
import 'package:mapoutapp/screens/search/search.dart';

class CategoriesCreateActivity extends StatefulWidget {
  const CategoriesCreateActivity({super.key});

  @override
  State<CategoriesCreateActivity> createState() => _CategoriesCreateActivityState();
}

class _CategoriesCreateActivityState extends State<CategoriesCreateActivity> {
  bool preferenciaDesactivada = true;
  Color? _colorBack = Colors.white, _colorFore = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateActivity()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF50C3CB)
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Preferencias',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.28,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(preferenciaDesactivada){
                            _color 
                          } else{
                            preferenciaDesactivada = false;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Cervezas'
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Café'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Idiomas'
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Escalada'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Cine'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Fotografia'
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Coches'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Motos'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Gimnasio'
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Videojuegos'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Lectura'
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Teatro'
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
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
          }, icon: const Icon(Icons.search, color: Color(0xFF50C3CB), size: 35,)),
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