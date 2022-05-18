import 'package:address_search_field/address_search_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/search_data.dart';
import 'package:mapoutapp/utils/constants/selected_preferences.dart';
import 'package:mapoutapp/utils/log_utils.dart';

class CreateActivityInfo extends StatefulWidget {
  const CreateActivityInfo({super.key});

  @override
  State<CreateActivityInfo> createState() => _CreateActivityInfoState();
}

class _CreateActivityInfoState extends State<CreateActivityInfo> {


  final GeoMethods geoMethods = GeoMethods(
    googleApiKey: 'AIzaSyBfAd8r3nmL2sS_JrVYhL_--ZxbDoReMFI',
    language: 'es',
    countryCode: 'es',
    country: 'Spain',
    city: 'Barcelona'
  );
  
  final _controller = TextEditingController();
  late Address destinationAddress;
  late String title, description;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: const [
                SizedBox(width: 50,),
                SizedBox(
                  width: 230,
                  child: Text(
                    'Acerca de mi evento',
                    style: TextStyle(
                      fontSize: 25
                    ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 10, 
                  color: const Color(0xFFF0F0F0),
                  style: BorderStyle.solid
                )
              ),
              child: Container(
                color: const Color(0xFFF0F0F0),
                child: SizedBox(
                  child: TextField(
                    onChanged: (value){
                      title = value;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: "Titulo",
                        fillColor: Color(0xFFF0F0F0),
                        prefixIcon: Icon(Icons.title, color: Color(0xFF50C3CB)),
                        contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                        border: InputBorder.none
                      ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 10, 
                  color: const Color(0xFFF0F0F0),
                  style: BorderStyle.solid
                )
              ),
              child: Container(
                color: const Color(0xFFF0F0F0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      onChanged: (value){
                        description = value;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Breve descripcion",
                        fillColor: Color(0xFFF0F0F0),
                        //prefixIcon: Icon(Icons.note, color: Color(0xFF50C3CB)),
                        contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 10, 
                  color: const Color(0xFFF0F0F0),
                  style: BorderStyle.solid
                )
              ),
              child: Container(
                color: const Color(0xFFF0F0F0),
                child:  SizedBox(
                  child: TextField(
                    controller: _controller,
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AddressSearchDialog(
                        geoMethods: geoMethods,
                        controller: _controller,
                        onDone: (Address address) => destinationAddress = address,
                      )),
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: "Direccion",
                      fillColor: Color(0xFFF0F0F0),
                      prefixIcon: Icon(Icons.streetview, color: Color(0xFF50C3CB)),
                      contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
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
                  LatLng finalAddress = LatLng(destinationAddress.coords!.latitude, destinationAddress.coords!.longitude);
                  LogUtils.showLog(finalAddress.toString());
                  eventSetup(title, description, finalAddress);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
              )
            )
          ],
        ),
      )
    );
  }

  Future<void> eventSetup(String title, String description, LatLng address) async{
    CollectionReference ads = FirebaseFirestore.instance.collection('ads');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();

    ads.add({
      'title': title,
      'description': description,
      'address': GeoPoint(address.latitude, address.longitude),
      'price': SearchData.priceData,
      'time': SearchData.timeData,
      'persons': SearchData.personData,
      'category': Preferences.preferencesSelectedCreate,
      'userid': [uid]
    });
    return;
  }
}