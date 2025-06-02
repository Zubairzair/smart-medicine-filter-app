import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;

  SearchScreen({required this.searchQuery});

  Stream<QuerySnapshot> getFilteredMedicines() {
    return FirebaseFirestore.instance
        .collection("Medicine")
        .orderBy("Name")
        .startAt([searchQuery])
        .endAt([searchQuery + '\uf8ff'])
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: getFilteredMedicines(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs;

            if (docs.isEmpty) {
              return Center(child: Text("No medicines found."));
            }

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                var medicine = docs[index].data() as Map<String, dynamic>;

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Row: Name + Sell Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                medicine['Name'] ?? 'No Name',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // future sell functionality
                              },
                              icon: Icon(
                                Icons.sell,
                                color: Colors.orange.shade700,
                              ),
                              tooltip: "Sell",
                            ),
                          ],
                        ),
                        Divider(thickness: 1, color: Colors.grey.shade300),
                        SizedBox(height: 6),
                        _buildInfoRow("Company", medicine['Company']),
                        _buildInfoRow("Generic", medicine['GenericName']),
                        _buildInfoRow("Type", medicine['Type']),
                        _buildInfoRow("Category", medicine['Category']),
                        _buildInfoRow("Price", medicine['Price']),
                        _buildInfoRow("Quantity", medicine['Quantity']),
                        _buildInfoRow("Expiry", medicine['ExpiryDate']),
                        _buildInfoRow("Batch No", medicine['BatchNo']),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.grey.shade600),
          SizedBox(width: 6),
          Text(
            "$label: ",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(
              value != null && value.toString().trim().isNotEmpty ? value.toString() : 'N/A',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
