import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

part 'auth_user.g.dart';

class AuthUser = _AuthUser with _$AuthUser;

abstract class _AuthUser with Store {
  @observable
  Users usr = Users();

  @action
  chekcUser(String username, String password) {
    validateUser(username, password).then((value) => usr = value);
  }
}

Future<Users> validateUser(String username, String password) async {
  Users users;
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> dataUser;
  await firestore
      .collection('users')
      .where('username', isEqualTo: username)
      .get()
      .then((value) => dataUser = value.docs);
  if (dataUser.length == 1) {
    Users data = Users.fromMap(dataUser[0].data());
    if (username == data.username && password == data.password) {
      users = data;
    }
  }
  return users;
}

void anonymousLogin() {
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
