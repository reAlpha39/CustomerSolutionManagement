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

  @observable
  bool checked;

  @observable
  int state = 0;

  @action
  checkUser(String username, String password) {
    checked = false;
    state = 1;
    usr = Users();
    validateUser(username, password).then((value) {
      if (value != null) {
        if (_validateUserPass(value, username, password)) {
          usr = value;
          checked = true;
          state = 2;
        } else {
          checked = false;
          state = 2;
        }
      } else {
        checked = false;
        state = 2;
      }
    });
  }
}

Future<Users> validateUser(String username, String password) async {
  Users users;
  try {
    await Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<QueryDocumentSnapshot> dataUser;
    await firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get()
        .then((value) => dataUser = value.docs);
    if (dataUser.length == 1) {
      users = Users.fromMap(dataUser[0].data());
    }
  } catch (e) {
    Exception("Connection error");
  }
  return users;
}

bool _validateUserPass(Users data, String username, String password) {
  bool check = false;
  if (username == data.username && password == data.password) {
    check = true;
  }
  return check;
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
