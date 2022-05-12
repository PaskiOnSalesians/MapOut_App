import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _currentPrecio = 0, _currentTiempo = 0, _currentPersonas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                Row(
                  children: [
                    const SizedBox(width: 50,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2, // 200
                      height: MediaQuery.of(context).size.height / 6,
                      child: const Text(
                        'BUSCAMOS UN PLAN?',
                        style: TextStyle(
                          fontSize: 30
                        ),
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        'Precio'
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.2,
                      child: Slider(
                        value: _currentPrecio,
                        max: 100,
                        label: _currentPrecio.round().toString(),
                        thumbColor: const Color(0xFFEB7C25),
                        divisions: 100,
                        activeColor: const Color(0xFFEB7C25),
                        inactiveColor: Colors.grey,
                        onChanged: (double value){
                          setState(() {
                            _currentPrecio = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        'Duración en horas'
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.2,
                      child: Slider(
                        value: _currentTiempo,
                        max: 12,
                        label: _currentTiempo.round().toString(),
                        thumbColor: const Color(0xFFEB7C25),
                        divisions: 12,
                        activeColor: const Color(0xFFEB7C25),
                        inactiveColor: Colors.grey,
                        onChanged: (double value){
                          setState(() {
                            _currentTiempo = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        'Personas'
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.2,
                      child: Slider(
                        value: _currentPersonas,
                        max: 12,
                        label: _currentPersonas.round().toString(),
                        thumbColor: const Color(0xFFEB7C25),
                        divisions: 12,
                        activeColor: const Color(0xFFEB7C25),
                        inactiveColor: Colors.grey,
                        onChanged: (double value){
                          setState(() {
                            _currentPersonas = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEB7C25),
                            border: Border.all(color: Colors.white),
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: const Text(
                              'BUSCAR AHORA',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: const Text(
                              'CREAR PLAN',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 5,),
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