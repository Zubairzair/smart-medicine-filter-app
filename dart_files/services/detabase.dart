import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to add medicine record to Firestore
  Future<void> addMedicineRecord(Map<String, dynamic> medicineData,
      String id) async {
    try {
      await _firestore.collection("Medicine").doc(id).set(medicineData);
      print("Medicine record added successfully!");
    } catch (e) {
      print("Error adding medicine record: $e");
      rethrow;
    }
  }

  Future<Stream<QuerySnapshot>> getmedicinesrecord() async {
    return await FirebaseFirestore.instance.collection("Medicine").snapshots();
  }

  Future UpdateRecord(String id, Map<String, dynamic>UpdateMap) async
  {
    return await FirebaseFirestore.instance.collection("Medicine")
        .doc(id)
        .update(UpdateMap);
  }

  Future DeleteRecord(String id) async
  {
    return await FirebaseFirestore.instance.collection("Medicine")
        .doc(id)
        .delete();
  }
}