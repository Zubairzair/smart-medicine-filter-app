import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_pharmacy/postmedicine.dart';
import 'package:smart_pharmacy/services/detabase.dart';

class ViewMedicine extends StatefulWidget {
  const ViewMedicine({super.key});

  @override
  State<ViewMedicine> createState() => _ViewMedicineState();
}

class _ViewMedicineState extends State<ViewMedicine> {
  Stream? medicineStream;
  final _formKey = GlobalKey<FormState>();

  final _controllers = {
    "Name": TextEditingController(),
    "Company": TextEditingController(),
    "GenericName": TextEditingController(),
    "Type": TextEditingController(),
    "Category": TextEditingController(),
    "Price": TextEditingController(),
    "Quantity": TextEditingController(),
    "ExpiryDate": TextEditingController(),
    "BatchNo": TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    loadMedicineStream();
  }

  loadMedicineStream() async {
    medicineStream = await DatabaseMethod().getmedicinesrecord();
    setState(() {});
  }

  Widget medicineList() {
    return StreamBuilder(
      stream: medicineStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        if (snapshot.data.docs.isEmpty)
          return Center(
            child: Text(
              "No record found",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          );

        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              shadowColor: Colors.blueAccent.withOpacity(0.4),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                title: Text(
                  ds["Name"] ?? "Name not available",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.indigo[900]),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Company: ${ds["Company"] ?? "-"}\nPrice: ${ds["Price"] ?? "-"} PKR\nExpiry Date: ${ds["ExpiryDate"] ?? "-"}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      height: 1.4,
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tooltip(
                      message: "Edit",
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () => showEditDialog(ds),
                      ),
                    ),
                    SizedBox(width: 6),
                    Tooltip(
                      message: "Delete",
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => showDeleteConfirmation(ds["id"]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  showDeleteConfirmation(String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirm",style: TextStyle(color:Colors.redAccent),),
        content: Text("Are you sure you want to delete this record?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () async {
              await DatabaseMethod().DeleteRecord(id);
              Navigator.pop(context);
              loadMedicineStream();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Record deleted successfully."),
                  backgroundColor: Colors.redAccent,
                ),
              );
            },
            child: Text("Delete",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  showEditDialog(DocumentSnapshot ds) {
    _controllers["Name"]!.text = ds["Name"];
    _controllers["Company"]!.text = ds["Company"];
    _controllers["GenericName"]!.text = ds["GenericName"];
    _controllers["Type"]!.text = ds["Type"];
    _controllers["Category"]!.text = ds["Category"];
    _controllers["Price"]!.text = ds["Price"];
    _controllers["Quantity"]!.text = ds["Quantity"];
    _controllers["ExpiryDate"]!.text = ds["ExpiryDate"];
    _controllers["BatchNo"]!.text = ds["BatchNo"];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Center(
          child: Text(
            "Edit Details",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
                fontSize: 20),
          ),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: _controllers.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      labelText: entry.key,
                      labelStyle:
                      TextStyle(color: Colors.indigo[700], fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.redAccent, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.redAccent, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Map<String, dynamic> updatedData = {
                  for (var e in _controllers.entries) e.key: e.value.text.trim(),
                  "id": ds["id"],
                };
                await DatabaseMethod()
                    .UpdateRecord(ds["id"], updatedData)
                    .then((_) {
                  Navigator.pop(context);
                  loadMedicineStream();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Record updated successfully."),
                      backgroundColor: Colors.green,
                    ),
                  );
                });
              }
            },
            child: Text(
              "Update",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 16, color: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text(
          "Medicine Records",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade700,
        elevation: 8,
        shadowColor: Colors.indigo.shade300,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.shade700,
        child: Icon(Icons.add, size: 28, color: Colors.white),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => MedicineForm()));
        },
        tooltip: "Add New Record",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: medicineList(),
      ),
    );
  }
}
