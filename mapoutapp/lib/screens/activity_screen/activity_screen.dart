import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/search/results/all_documents.dart';
import 'package:mapoutapp/utils/constants/activity_details.dart';

class ActivityDetailsScreen extends StatefulWidget {
  const ActivityDetailsScreen({super.key});

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  final db = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(ActivityDetails.title, style: const TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllDocuments()));
        },
        icon: const Icon(Icons.arrow_back, color: Color(0xFF50C3CB),),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
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
                          return Text(
                            (doc.data() as dynamic)['title']
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
}