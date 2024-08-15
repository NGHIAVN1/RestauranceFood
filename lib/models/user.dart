import 'dart:core';
class User {
  String? documentId;
  String? phoneNumber;
  String? email;
  String? photoUrl;
  String? fullName;
  String? password;
  String? address;
  String? uid;
  String? date;
  User(
      {this.phoneNumber,
      this.fullName,
      this.address,
      this.uid,
      this.documentId,
      this.password,
      this.date,
      this.email,
      this.photoUrl 
      });
  factory User.fromDoc(dynamic doc) =>
      User(documentId: doc.documentId, date: doc["date"]);
}
