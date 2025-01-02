import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/my_app_bar.dart';
import 'package:firebase_practice/pages/upload_images/card_image.dart';
import 'package:firebase_practice/read,edit,delete_data/edit_user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? _imageUrl;
  void _showEditDialog(BuildContext context, String documentId) async {
    // Fetch the current user's data
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(documentId)
        .get();

    if (userDoc.exists) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      String firstName = data['first name'];
      String lastName = data['last name'];
      int age = data['age'];

      // Show the dialog to edit user info
      showDialog(
        context: context,
        builder: (context) {
          return EditUserDialog(
            documentId: documentId,
            firstName: firstName,
            lastName: lastName,
            age: age,
          );
        },
      );
    } else {
      print('User not found');
    }
  }
  // // Fetch user details from Firestore based on the logged-in user's email
  // Future<Map<String, dynamic>?> _getUserDetails() async {
  //   try {
  //     // Get the current user
  //     User? currentUser = FirebaseAuth.instance.currentUser;

  //     if (currentUser != null) {
  //       String email = currentUser.email!;
  //       // Query Firestore for the user's document
  //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //           .collection('users')
  //           .where('email', isEqualTo: email)
  //           .get();

  //       // If a document is found, return the data
  //       if (querySnapshot.docs.isNotEmpty) {
  //         return querySnapshot.docs.first.data() as Map<String, dynamic>;
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching user details: $e');
  //   }
  //   return null; // Return null if no data is found
  // }
  Stream<QuerySnapshot> _getUserDetailsStream() {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String email = currentUser.email!;
        return FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .snapshots();
      }
    } catch (e) {
      print('Error fetching user details stream: $e');
    }
    return const Stream
        .empty(); // Return an empty stream if no user is logged in or an error occurs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: 'Account Details',
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _getUserDetailsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading user details.');
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Text('No user details found.');
              }

              // Extract user details and document ID
              final userDoc = snapshot.data!.docs.first;
              final userDetails = userDoc.data() as Map<String, dynamic>;
              // ignore: unused_local_variable
              final documentId = userDoc.id;

              return Column(
                children: [
                  CardImage(
                    imageUrl: _imageUrl,
                    onUpload: (imageUrl) {
                      setState(() {
                        _imageUrl = imageUrl;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.primary,
                      title: Text(
                          'Name: ${userDetails['first name'] ?? 'N/A'} ${userDetails['last name'] ?? 'N/A'}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.primary,
                      title:
                          Text('Age: ${userDetails['age'] ?? 'N/A'} years old'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.primary,
                      title: Text('Email: ${userDetails['email'] ?? 'N/A'}'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onTertiary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            final documentId = snapshot.data!.docs.first
                                .id; // Retrieve the document ID
                            _showEditDialog(context,
                                documentId); // Pass context and document ID
                          },
                          child: Text(
                            'Edit Details',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onTertiary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SettingsPage(),
                            //   ),
                            // );
                          },
                          child: Icon(
                            Icons.settings,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
