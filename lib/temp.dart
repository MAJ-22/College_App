import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getCurrentUserBranch() async {
  try {
    // Get current user ID
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Get reference to Firestore collection
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('Profile');

    // Get document snapshot for the current user
    DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();

    // Check if user exists
    if (userSnapshot.exists) {
      // Retrieve branch value from the document
      String branch = userSnapshot.get('branch');

      // Now you can use the branch value as needed
      print('Branch for current user: $branch');
    } else {
      print('User not found!');
    }
  } catch (error) {
    print('Error retrieving user branch: $error');
  }
}

void main() {
  getCurrentUserBranch();
}
