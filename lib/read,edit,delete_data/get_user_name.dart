import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
   GetUserName({super.key, required this.documentId});

  
//CollectionReference users = ... creates a reference to the users collection in Firestore. This is where all the user data is stored
  @override
  Widget build(BuildContext context) {
    //Get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['first name']} ${data['last name']}, ${data['age']} years old');
          }
          return const Text('Loading...');
        });
  } 
}
