import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthUser {
  Users usr = Users();
  void firebaseAuth(String username, String password) async {
    try {
      await Firebase.initializeApp();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      List<QueryDocumentSnapshot> dataUser;
      await firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get()
          .then((value) => dataUser = value.docs);
      usr = Users.fromMap(dataUser[0].data());
    } catch (e) {
      print(e.toString());
    }
  }

  anonymousLogin() {
    try {
      FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (user != null) {
          var isAnonymous = user.isAnonymous;
          var uid = user.uid;
          print(
              'In FirestoreServices, isAnonymous = $isAnonymous and uid = $uid');
        } else {
          FirebaseAuth.instance.signInAnonymously().then((user) {
            print(
                'In FirestoreServices, isAnonymous = ${user.additionalUserInfo} and uid = ${user.credential}');
          });
        }
      });
    } catch (e) {}
  }
}
