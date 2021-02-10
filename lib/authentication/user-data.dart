import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {

  UserData(
    {this.email, 
    this.password, 
    this.id, 
    this.name,
    this.age,
    this.birthday,
    }
  );

  UserData.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.data() as String;
    email = doc.data() as String;
    age = doc.data()as String;
    birthday = doc.data()as String;

  }
  String id;
  String email;
  String password;
  String name;
  String age;
  String birthday;

  DocumentReference get firestoreRef =>
    FirebaseFirestore.instance.doc('Users/$id');

  Future<void> saveInfo() async {
    await firestoreRef.set(toMap());
  }
  
  Map<String, dynamic> toMap() {
    return {
      'Name' : name,
      'E-mail' : email,
      'Age' : age,
      'Birthday' : birthday
    };
  }

}