import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white), // White title text
        ),
        iconTheme: IconThemeData(color: Colors.white), // White icon color
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smart Pharmacy – Terms & Conditions",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 16),
            Text(
              "By using the Smart Pharmacy app, you agree to comply with the following terms and conditions. Please read them carefully.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            buildSectionTitle("1. Acceptance of Terms"),
            buildBullet("Using this app means you accept all the terms outlined here."),
            buildBullet("If you do not agree, please do not use the app."),
            SizedBox(height: 16),
            buildSectionTitle("2. Use of App"),
            buildBullet("This app is intended for medical store owners and pharmacists."),
            buildBullet("You are responsible for the accuracy of the data you enter."),
            buildBullet("You may not misuse or manipulate app functionalities."),
            SizedBox(height: 16),
            buildSectionTitle("3. Data & Security"),
            buildBullet("Your data is stored securely using Firebase services."),
            buildBullet("We are not liable for data loss due to user error or external breach."),
            buildBullet("Users must avoid unauthorized access or tampering."),
            SizedBox(height: 16),
            buildSectionTitle("4. Intellectual Property"),
            buildBullet("All designs, code, and branding are the intellectual property of the developer."),
            buildBullet("You may not copy, modify, or distribute without permission."),
            SizedBox(height: 16),
            buildSectionTitle("5. Termination"),
            buildBullet("We reserve the right to terminate access for any misuse."),
            buildBullet("Violations may result in data deletion or permanent block."),
            SizedBox(height: 16),
            buildSectionTitle("6. Limitation of Liability"),
            buildBullet("We are not responsible for medical or financial consequences from app use."),
            buildBullet("Always verify your inputs and maintain proper backups."),
            SizedBox(height: 16),
            buildSectionTitle("7. Changes to Terms"),
            buildBullet("These terms may be updated without prior notice."),
            buildBullet("Continued use implies agreement to the updated terms."),
            SizedBox(height: 24),
            Text(
              "If you have any questions about these terms, feel free to contact the developer at:",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email, color: Colors.teal),
                SizedBox(width: 8),
                Text(
                  "hafizzubair279@gmail.com",
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                "© 2025 Smart Pharmacy App – All Rights Reserved",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
    );
  }

  Widget buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16, height: 1.4))),
        ],
      ),
    );
  }
}
