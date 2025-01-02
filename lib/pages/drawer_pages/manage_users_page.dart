import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/my_app_bar.dart';
import 'package:firebase_practice/pages/signin_page.dart';
import 'package:firebase_practice/read,edit,delete_data/edit_user_dialog.dart';
import 'package:firebase_practice/read,edit,delete_data/get_user_name.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class ManageUsersPage extends StatefulWidget {
  const ManageUsersPage({super.key});

  @override
  State<ManageUsersPage> createState() => _ManageUsersPageState();
}

//orderBy() sorts the documents by the field age in ascending order
//get() fetches all the documents from the users collection based on the sort order defined above. It returns a QuerySnapshot, which is like a big box that holds all the documents.
//.then(...) is used to process the data once it’s retrieved. snapshot here is the QuerySnapshot that contains all the documents.
//.docs gives us access to a list of documents in the snapshot.
//.forEach((document) {...}) loops over each document inside snapshot.docs to process them one by one.
//document.reference.id gets the unique ID of the document (like doc123, doc456, etc.).
//docIDs.add(...) adds that document ID to the docIDs list.
class _ManageUsersPageState extends State<ManageUsersPage> {
  //document IDs
  List<String> docIDs = [];

  //Get this docment ids
  // Future getDocId() async {
  //   // Clear the list before fetching
  //   docIDs.clear();
  //   //This part is asking Firebase Firestore to get the users collection.
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .orderBy('age', descending: false)
  //       .get()
  //       .then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             // ignore: avoid_print
  //             // print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

  // Function to log the user out and navigate to SignInPage
  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out the user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInPage()), // Navigate to SignInPage
      );
    } catch (e) {
      // ignore: avoid_print
      print("Error logging out: $e");
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onTertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  _logout(context); // Log out and navigate to SignInPage
                },
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          );
        });
  }

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

  // Create a function to fetch data from Firestore
  Stream<QuerySnapshot> getUserStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .orderBy('age', descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String email = user?.email ?? 'No user signed in';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: email,
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
        actions: [
          IconButton(
            onPressed: _showDialog,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Use snapshots() for real-time data updates
        stream: getUserStream(), // Using the function to get the stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          }

          // Get document IDs from snapshot data
          List<String> docIDs =
              snapshot.data!.docs.map((doc) => doc.id).toList();
          return ListView.builder(
            itemCount: docIDs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: Theme.of(context).colorScheme.primary,
                  title: GetUserName(documentId: docIDs[index]),
                  trailing: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // When the Edit button is pressed, show the EditUserDialog
                      _showEditDialog(context, docIDs[index]);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
