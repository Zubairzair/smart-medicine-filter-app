import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpiringMedicinesScreen extends StatefulWidget {
  @override
  _ExpiringMedicinesScreenState createState() => _ExpiringMedicinesScreenState();
}

class _ExpiringMedicinesScreenState extends State<ExpiringMedicinesScreen> {
  List<QueryDocumentSnapshot> medicines = [];
  bool loading = false;

  Future<void> fetchExpiringMedicines() async {
    setState(() {
      loading = true;
    });

    DateTime now = DateTime.now();
    DateTime after8Days = now.add(Duration(days: 8));

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Medicine')
          .where('ExpiryDate', isGreaterThanOrEqualTo: Timestamp.fromDate(now))
          .where('ExpiryDate', isLessThanOrEqualTo: Timestamp.fromDate(after8Days))
          .orderBy('ExpiryDate')
          .get();

      setState(() {
        medicines = snapshot.docs;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('Error fetching medicines: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expiring Medicines (Next 8 Days)'),
        backgroundColor: Colors.green.shade700,
      ),
      body: loading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      )
          : medicines.isEmpty
          ? const Center(
        child: Text(
          "No medicines expiring within next 8 days",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final doc = medicines[index];
          final name = doc['Name'] ?? 'Unnamed';
          final expiry = (doc['ExpiryDate'] as Timestamp).toDate();

          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.local_pharmacy, color: Colors.red),
              title: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ExpiryDate: ${expiry.toLocal().toString().split(' ')[0]}',
              ),
              trailing:
              const Icon(Icons.warning_amber, color: Colors.orangeAccent),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fetchExpiringMedicines,
        label: const Text("Check Expiry"),
        icon: const Icon(Icons.refresh),
        backgroundColor: Colors.green,
      ),
    );
  }
}
