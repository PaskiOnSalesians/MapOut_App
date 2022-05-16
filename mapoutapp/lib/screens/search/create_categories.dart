import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/search/create_activity.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:selectable_container/selectable_container.dart';

class CategoriesCreateActivity extends StatefulWidget {
  const CategoriesCreateActivity({super.key});

  @override
  State<CategoriesCreateActivity> createState() => _CategoriesCreateActivityState();
}

class _CategoriesCreateActivityState extends State<CategoriesCreateActivity> {
  bool selectionCerveza = false, selectionCafe = false, selectionIdiomas = false;
  bool selectionEscalada = false, selectionCine = false, selectionFoto = false;
  bool selectionCoches = false, selectionMotos = false, selectionGimnasio = false;
  bool selectionVideojuegos = false, selectionLectura = false, selectionTeatro = false;

  Color? _colorForeCerveza = Colors.black, _colorForeCafe = Colors.black, _colorForeIdiomas = Colors.black;
  Color? _colorForeEscalada = Colors.black, _colorForeCine = Colors.black, _colorForeFoto = Colors.black;
  Color? _colorForeCoches = Colors.black, _colorForeMotos = Colors.black, _colorForeGimnasio = Colors.black;
  Color? _colorForeVideojuegos = Colors.black, _colorForeLectura = Colors.black, _colorForeTeatro = Colors.black;

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
              height: MediaQuery.of(context).size.height / 1.52,
              child: Column(
                children: [
                  Row(
                    children: [
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionCerveza,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCerveza){
                              _colorForeCerveza = Colors.black;
                              selectionCerveza = false;
                            } else{
                              _colorForeCerveza = Colors.white;
                              selectionCerveza = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Cervezas',
                            style: TextStyle(
                              color: _colorForeCerveza,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionCafe,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCafe){
                              _colorForeCafe = Colors.black;
                              selectionCafe = false;
                            } else{
                              _colorForeCafe = Colors.white;
                              selectionCafe = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Café',
                            style: TextStyle(
                              color: _colorForeCafe,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionIdiomas,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionIdiomas){
                              _colorForeIdiomas = Colors.black;
                              selectionIdiomas = false;
                            } else{
                              _colorForeIdiomas = Colors.white;
                              selectionIdiomas = true;
                            }

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Idiomas',
                            style: TextStyle(
                              color: _colorForeIdiomas,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionEscalada,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionEscalada){
                              _colorForeEscalada = Colors.black;
                              selectionEscalada = false;
                            } else{
                              _colorForeEscalada = Colors.white;
                              selectionEscalada = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Escalada',
                            style: TextStyle(
                              color: _colorForeEscalada,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionCine,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCine){
                              _colorForeCine = Colors.black;
                              selectionCine = false;
                            } else{
                              _colorForeCine = Colors.white;
                              selectionCine = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Cine',
                            style: TextStyle(
                              color: _colorForeCine,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionFoto,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionFoto){
                              _colorForeFoto = Colors.black;
                              selectionFoto = false;
                            } else{
                              _colorForeFoto = Colors.white;
                              selectionFoto = true;
                            }

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Fotografia',
                            style: TextStyle(
                              color: _colorForeFoto,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionCoches,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCoches){
                              _colorForeCoches = Colors.black;
                              selectionCoches = false;
                            } else{
                              _colorForeCoches = Colors.white;
                              selectionCoches = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Coches',
                            style: TextStyle(
                              color: _colorForeCoches,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionMotos,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionMotos){
                              _colorForeMotos = Colors.black;
                              selectionMotos = false;
                            } else{
                              _colorForeMotos = Colors.white;
                              selectionMotos = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Motos',
                            style: TextStyle(
                              color: _colorForeMotos,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionGimnasio,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionGimnasio){
                              _colorForeGimnasio = Colors.black;
                              selectionGimnasio = false;
                            } else{
                              _colorForeGimnasio = Colors.white;
                              selectionGimnasio = true;
                            }

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Gimnasio',
                            style: TextStyle(
                              color: _colorForeGimnasio,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionVideojuegos,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionVideojuegos){
                              _colorForeVideojuegos = Colors.black;
                              selectionVideojuegos = false;
                            } else{
                              _colorForeVideojuegos = Colors.white;
                              selectionVideojuegos = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Videojuegos',
                            style: TextStyle(
                              color: _colorForeVideojuegos,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionLectura,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionLectura){
                              _colorForeLectura = Colors.black;
                              selectionLectura = false;
                            } else{
                              _colorForeLectura = Colors.white;
                              selectionLectura = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Lectura',
                            style: TextStyle(
                              color: _colorForeLectura,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFF50C3CB),
                        selectedBackgroundColor: const Color(0xFF50C3CB),
                        selected: selectionTeatro,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionTeatro){
                              _colorForeTeatro = Colors.black;
                              selectionTeatro = false;
                            } else{
                              _colorForeTeatro = Colors.white;
                              selectionTeatro = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Teatro',
                            style: TextStyle(
                              color: _colorForeTeatro,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF50C3CB),
                        border: Border.all(color: const Color(0xFF50C3CB)),
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        title:  const Text(
                          'CONTINUAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          // Agregar a firebase un documento nuevo
                        },
                      )
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 50,),
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