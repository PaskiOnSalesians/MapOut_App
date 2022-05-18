import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/profile/profile_definitivo.dart';
import 'package:mapoutapp/screens/search/create_activity_titles.dart';
import 'package:mapoutapp/screens/search/create_categories.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/search_data.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({Key? key}) : super(key: key);

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  double _currentPrecio = 0, _currentTiempo = 0, _currentPersonas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/ 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 150,),
                  const MainTitle(),
                  const PriceTitle(),
                  
                  // Slider Precio
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
                          thumbColor: const Color(0xFF50C3CB),
                          divisions: 100,
                          activeColor: const Color(0xFF50C3CB),
                          inactiveColor: Colors.grey,
                          onChanged: (double value){
                            setState(() {
                              _currentPrecio = value;
                              SearchData.priceData = _currentPrecio;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const TimeTitle(),
                  
                  // Slider Tiempo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 28,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width /1.2,
                        child: Slider(
                          value: _currentTiempo,
                          max: 5,
                          label: _currentTiempo.round().toString(),
                          thumbColor: const Color(0xFF50C3CB),
                          divisions: 5,
                          activeColor: const Color(0xFF50C3CB),
                          inactiveColor: Colors.grey,
                          onChanged: (double value){
                            setState(() {
                              _currentTiempo = value;
                              SearchData.timeData = _currentTiempo;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const PersonTitle(),
                  
                  // Slider Personas
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
                          thumbColor: const Color(0xFF50C3CB),
                          divisions: 12,
                          activeColor: const Color(0xFF50C3CB),
                          inactiveColor: Colors.grey,
                          onChanged: (double value){
                            setState(() {
                              _currentPersonas = value;
                              SearchData.personData = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ActionButtons()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: TextButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoriesCreateActivity()));
                    },
                    icon: const Icon(Icons.arrow_right, color: Colors.grey,),
                    label: const Text('Categorias', style: TextStyle(color: Colors.grey),)
                  )
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Menu()
          ],
        )
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 50,),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2, // 200
          height: MediaQuery.of(context).size.height / 6,
          child: const Text(
            'CREAMOS UN PLAN?',
            style: TextStyle(
              fontSize: 30
            ),
          )
        ),
      ],
    );
  }
}

class PriceTitle extends StatelessWidget {
  const PriceTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            'Precio',
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}

class TimeTitle extends StatelessWidget {
  const TimeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            'Tiempo (en horas)',
            style: TextStyle(
              fontSize: 20
            ),

          ),
        ),
      ],
    );
  }
}

class PersonTitle extends StatelessWidget {
  const PersonTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            'Personas',
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
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
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                title: const Text(
                  'BUSCAR PLAN',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
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
                color: const Color(0xFF50C3CB),
                border: Border.all(color: const Color(0xFF50C3CB)),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                title: const Text(
                  'CREAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  if(SearchData.personData! > 0.0 && SearchData.priceData! > 0.0 && SearchData.timeData! > 0.0){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateActivityInfo()));
                  } else{
                    Fluttertoast.showToast(
                      msg: 'Error: Tiene que haber un precio, tiempo i personas',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16
                    );
                  }
                },
              )
            )
          ],
        )
      ],
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