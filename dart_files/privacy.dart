import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // AppBar title in white
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // AppBar icon in white
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smart Pharmacy – Privacy Policy",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 16),
            Text(
              "We value your trust and are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            buildSectionTitle("1. Information Collection"),
            buildBullet("We collect medicine-related data that you input manually."),
            buildBullet("No personal information is required for using this app."),
            buildBullet("We may collect app usage statistics to improve performance."),

            SizedBox(height: 16),
            buildSectionTitle("2. Data Usage"),
            buildBullet("All information is stored securely in Firebase."),
            buildBullet("We never share or sell your data to any third party."),
            buildBullet("Data is used solely for internal functioning and analytics."),

            SizedBox(height: 16),
            buildSectionTitle("3. Data Security"),
            buildBullet("We use Firebase to store and protect your data with encryption."),
            buildBullet("Only you (the user) can access your added records."),
            buildBullet("We regularly update our systems for enhanced protection."),

            SizedBox(height: 16),
            buildSectionTitle("4. User Control"),
            buildBullet("You can delete or update any data you have entered."),
            buildBullet("Future versions will offer more control through user authentication."),

            SizedBox(height: 16),
            buildSectionTitle("5. Children’s Privacy"),
            buildBullet("This app is intended for use by medical professionals and shop owners."),
            buildBullet("We do not knowingly collect data from children under 13."),

            SizedBox(height: 16),
            buildSectionTitle("6. Policy Updates"),
            buildBullet("This Privacy Policy may be updated periodically."),
            buildBullet("Changes will be notified via app update or message."),

            SizedBox(height: 24),
            Text(
              "If you have any questions or concerns about this policy, feel free to contact us at:",
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
