import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nursie/authentication/user-data.dart';

class UserAuth extends ChangeNotifier{

  UserAuth () {
    loadLoggedUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserData user;

  Future<void> signIn({UserData userData, Function onFail, Function onSuccess}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
      
    await loadLoggedUser(firebaseUser: result.user);

    onSuccess();

    } catch (e) {
        print('error with: $e');
    }
  }

  Future<void> signUp({UserData userData, Function onFail, Function onSuccess}) async {
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);

      userData.id = result.user.uid;
      await userData.saveInfo();

      onSuccess();
    } catch (e) {
      onFail('error WITH: $e');
    }
  }
  
  Future<void> loadLoggedUser({User firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot documentUser = await firestore.collection('Users')
        .doc(currentUser.uid).get();

      user = UserData.fromDocument(documentUser);

      notifyListeners();
    }
  }
}