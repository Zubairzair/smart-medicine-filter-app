import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {"question": "What is Smart Pharmacy App?", "answer": "It is a digital platform to manage medicines, inventory, and sales for medical stores."},
    {"question": "How can I add new medicines?", "answer": "Go to 'Add Medicine' screen, fill out the form, and click submit."},
    {"question": "How to delete a medicine record?", "answer": "On the 'View All Medicines' screen, tap the delete icon next to the medicine."},
    {"question": "Can I update a medicine’s price?", "answer": "Yes. Use the update icon next to the medicine record."},
    {"question": "Is data stored online?", "answer": "Yes, the app uses Firebase for secure cloud-based storage."},
    {"question": "Can multiple users use the app?", "answer": "Yes, the app supports multiple user roles in the future."},
    {"question": "How to enable dark mode?", "answer": "Go to Settings > Dark Mode toggle."},
    {"question": "Can I manage inventory with this app?", "answer": "Yes. You can view, add, update, and delete inventory records."},
    {"question": "Is there a limit on medicine entries?", "answer": "No, you can add unlimited medicines using cloud storage."},
    {"question": "How to contact developer?", "answer": "Go to Contact Us screen. You'll find developer's email and phone."},
    {"question": "Can I search for medicines?", "answer": "Search feature will be added in future updates."},
    {"question": "What platforms are supported?", "answer": "Currently, it supports Android. Web and iOS coming soon."},
    {"question": "Is the app free?", "answer": "Yes. This version is free for study and demo purposes."},
    {"question": "Can I backup my data?", "answer": "Yes. Firebase handles real-time and secure backups automatically."},
    {"question": "What to do if app crashes?", "answer": "Please contact the developer with crash details for support."},
    {"question": "Is there a login system?", "answer": "Not yet. Authentication will be added in future versions."},
    {"question": "Can I use it offline?", "answer": "No. Internet is required to sync data with Firebase."},
    {"question": "How can I delete my account?", "answer": "Currently, user accounts are not implemented."},
    {"question": "How often is the app updated?", "answer": "Regularly. Stay tuned for upcoming updates and features."},
    {"question": "Where is data stored?", "answer": "All data is securely stored in Firebase Firestore."},
    {"question": "Can I edit medicine information?", "answer": "Yes. Tap on the edit icon next to the medicine record."},
    {"question": "How can I view all medicine entries?", "answer": "Go to 'View All Medicines' from the homepage."},
    {"question": "What if I forgot to add expiry date?", "answer": "You can edit the entry anytime using the update option."},
    {"question": "Can I export data to Excel?", "answer": "This feature is planned for future versions."},
    {"question": "What technology is used?", "answer": "Flutter (frontend) and Firebase (backend)."},
    {"question": "How to suggest a new feature?", "answer": "Use the Contact Us screen to reach out with suggestions."},
    {"question": "Is my data safe?", "answer": "Yes. Firebase ensures high-level data encryption and security."},
    {"question": "Can I use this for a hospital?", "answer": "Currently optimized for pharmacies, but can be extended."},
    {"question": "How do I update the app?", "answer": "You’ll get notified on the Play Store when updates are released."},
    {"question": "Does it support barcodes?", "answer": "Not yet, but barcode scanning will be added soon."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ...faqList.map((faq) => Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ExpansionTile(
              title: Text(
                faq['question']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    faq['answer']!,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          )),
          SizedBox(height: 24),
          Divider(thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  "Didn't find your question?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  "Feel free to contact us for any queries or support.",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                Text(
                  "📧 Email: hafizzubair279@gmail.com",
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
