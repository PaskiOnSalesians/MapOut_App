
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:address_search_field/address_search_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/activity_details.dart';
import 'package:mapoutapp/utils/constants/selected_preferences.dart';

class AllDocuments extends StatefulWidget {
  const AllDocuments({super.key});

  @override
  State<AllDocuments> createState() => _AllDocumentsState();
}

class _AllDocumentsState extends State<AllDocuments> {
  final db = FirebaseFirestore.instance;

  bool toggle = false;
  bool addElement = true;

  Icon iconButtonTile = const Icon(Icons.add, color: Color(0xFF50C3CB));

  String titleActivity = '', descriptionActivity = '';

  late GeoMethods geoMethods;
  late TextEditingController originCtrl;
  late TextEditingController destCtrl;
  late Coords initialCoords;


  Future<List<String>> getCategory() async{
    List<String> categoryList;
    List<String> finalList = [];
    String auxiliarVar;

    DocumentSnapshot data = await FirebaseFirestore.instance
    .collection('ads').doc().get();

    auxiliarVar = data['category'];

    categoryList = Preferences.preferencesSelectedSearch;

    if(categoryList.contains(auxiliarVar)) {
      finalList.add(auxiliarVar);
    }

    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
        }, icon: const Icon(Icons.arrow_back, color: Color(0xFF50C3CB),)),
        title: const Text('Lista de actividades', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children:  [
            const SizedBox(height: 50,),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.38,
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('ads').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator());
                  } else{
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return Card(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),),
                            child: ListTile(
                              leading: IconButton(
                                onPressed: (){
                                  setState(() {
                                    if(addElement){
                                      addUserSetup(doc.id);
                                      toggle = !toggle;
                                      Fluttertoast.showToast(
                                        msg: 'Actividad añadida correctamente',
                                        textColor: Colors.white,
                                        backgroundColor: Colors.green
                                      );
                                      //iconButtonTile = const Icon(Icons.done, color: Color(0xFF50C3CB));
                                      addElement = false;
                                    } else{
                                      deleteUserSetup(doc.id);
                                      Fluttertoast.showToast(
                                        msg: 'Actividad borrada correctamente',
                                        textColor: Colors.white,
                                        backgroundColor: Colors.red
                                      );
                                      //iconButtonTile = const Icon(Icons.add, color: Color(0xFF50C3CB));
                                      addElement = true;
                                    }
                                    
                                  });
                                },
                                icon: iconButtonTile
                              ),
                              title: Text(
                                (doc.data() as dynamic)['title'],
                                style: const TextStyle(
                                  color: Color(0xFF50C3CB),
                                  fontSize: 20
                                ),
                              ),
                              onTap: (){
                                // Getting data for showing the next window
                                ActivityDetails.idActivity = doc.id.toString();
                                
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ActivityDetailsScreen()));
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addUserSetup(String documentName) async{
    CollectionReference ads = FirebaseFirestore.instance.collection('ads');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    List<dynamic> list = [];

    list.add(uid);

    ads.doc(documentName).update({
      'userid': FieldValue.arrayUnion(list)
    });
    return;
  }

  Future<void> deleteUserSetup(String documentName) async{
    CollectionReference ads = FirebaseFirestore.instance.collection('ads');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    List<dynamic> list = [];

    list.add(uid);

    ads.doc(documentName).update({
      'userid': FieldValue.arrayRemove(list)
    });
    return;
  }
}