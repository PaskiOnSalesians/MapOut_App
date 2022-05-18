import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/selected_preferences.dart';
import 'package:selectable_container/selectable_container.dart';

class CategoriesSearch extends StatefulWidget {
  const CategoriesSearch({super.key});

  @override
  State<CategoriesSearch> createState() => _CategoriesSearchState();
}

class _CategoriesSearchState extends State<CategoriesSearch> {
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFEB7C25)
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
        ),
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
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.32,
              child: Column(
                children: [
                  Row(
                    children: [
                      SelectableContainer(
                        borderRadius: 50,
                        unselectedBorderColor: Colors.grey,
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionCerveza,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCerveza){

                              if(Preferences.preferencesSelectedSearch.contains("Cerveza")){
                                Preferences.preferencesSelectedSearch.remove("Cerveza");
                              }

                              _colorForeCerveza = Colors.black;

                              selectionCerveza = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Cerveza")){
                                  Preferences.preferencesSelectedSearch.add("Cerveza");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionCafe,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCafe){

                              if(Preferences.preferencesSelectedSearch.contains("Café")){
                                Preferences.preferencesSelectedSearch.remove("Café");
                              }

                              _colorForeCafe = Colors.black;

                              selectionCafe = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Café")){
                                  Preferences.preferencesSelectedSearch.add("Café");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionIdiomas,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionIdiomas){

                              if(Preferences.preferencesSelectedSearch.contains("Idiomas")){
                                Preferences.preferencesSelectedSearch.remove("Idiomas");
                              }

                              _colorForeIdiomas = Colors.black;

                              selectionIdiomas = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Idiomas")){
                                  Preferences.preferencesSelectedSearch.add("Idiomas");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionEscalada,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionEscalada){

                              if(Preferences.preferencesSelectedSearch.contains("Escalada")){
                                Preferences.preferencesSelectedSearch.remove("Escalada");
                              }

                              _colorForeEscalada = Colors.black;

                              selectionEscalada = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Escalada")){
                                  Preferences.preferencesSelectedSearch.add("Escalada");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionCine,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCine){

                              if(Preferences.preferencesSelectedSearch.contains("Cine")){
                                Preferences.preferencesSelectedSearch.remove("Cine");
                              }

                              _colorForeCine = Colors.black;

                              selectionCine = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Cine")){
                                  Preferences.preferencesSelectedSearch.add("Cine");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionFoto,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionFoto){

                              if(Preferences.preferencesSelectedSearch.contains("Foto")){
                                Preferences.preferencesSelectedSearch.remove("Foto");
                              }

                              _colorForeFoto = Colors.black;

                              selectionFoto = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Foto")){
                                  Preferences.preferencesSelectedSearch.add("Foto");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionCoches,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionCoches){

                              if(Preferences.preferencesSelectedSearch.contains("Coches")){
                                Preferences.preferencesSelectedSearch.remove("Coches");
                              }

                              _colorForeCoches = Colors.black;

                              selectionCoches = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Coches")){
                                  Preferences.preferencesSelectedSearch.add("Coches");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionMotos,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionMotos){

                              if(Preferences.preferencesSelectedSearch.contains("Motos")){
                                Preferences.preferencesSelectedSearch.remove("Motos");
                              }

                              _colorForeMotos = Colors.black;

                              selectionMotos = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Motos")){
                                  Preferences.preferencesSelectedSearch.add("Motos");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionGimnasio,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionGimnasio){

                              if(Preferences.preferencesSelectedSearch.contains("Gimnasio")){
                                Preferences.preferencesSelectedSearch.remove("Gimnasio");
                              }

                              _colorForeGimnasio = Colors.black;

                              selectionGimnasio = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Gimnasio")){
                                  Preferences.preferencesSelectedSearch.add("Gimnasio");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionVideojuegos,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionVideojuegos){

                              if(Preferences.preferencesSelectedSearch.contains("Videojuegos")){
                                Preferences.preferencesSelectedSearch.remove("Videojuegos");
                              }

                              _colorForeVideojuegos = Colors.black;

                              selectionVideojuegos = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Videojuegos")){
                                  Preferences.preferencesSelectedSearch.add("Videojuegos");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionLectura,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionLectura){

                              if(Preferences.preferencesSelectedSearch.contains("Lectura")){
                                Preferences.preferencesSelectedSearch.remove("Lectura");
                              }

                              _colorForeLectura = Colors.black;

                              selectionLectura = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Lectura")){
                                  Preferences.preferencesSelectedSearch.add("Lectura");
                                }

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
                        selectedBorderColor: const Color(0xFFEB7C25),
                        selectedBackgroundColor: const Color(0xFFEB7C25),
                        selected: selectionTeatro,
                        marginColor: Colors.white,
                        onValueChanged: (value) {
                          setState(() {
                            if(selectionTeatro){

                              if(Preferences.preferencesSelectedSearch.contains("Teatro")){
                                Preferences.preferencesSelectedSearch.remove("Teatro");
                              }

                              _colorForeTeatro = Colors.black;

                              selectionTeatro = false;
                            } else{
                                if(!Preferences.preferencesSelectedSearch.contains("Teatro")){
                                  Preferences.preferencesSelectedSearch.add("Teatro");
                                }

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