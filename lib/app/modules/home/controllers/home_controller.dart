import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   DocumentReference docRef = firestore.collection('catalog-home').doc(docID);
  //   return docRef.get();
  // }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference catalog = firestore.collection('catalog-home');
    return catalog.snapshots();
  }
}
