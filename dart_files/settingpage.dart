import 'package:flutter/material.dart';
import 'package:smart_pharmacy/aboutpage.dart';
import 'package:smart_pharmacy/contact.dart';
import 'package:smart_pharmacy/faq.dart';
import 'package:smart_pharmacy/privacy.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isDarkMode = false;
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildSettingTile({required IconData icon, required String title, Widget? trailing, VoidCallback? onTap}) {
    return ScaleTransition(
      scale: _animation,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 8),
        shadowColor: Colors.teal.withOpacity(0.3),
        child: ListTile(
          leading: Icon(icon, color: Colors.teal, size: 28),
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Changed to white
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Icon color white
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSettingTile(
              icon: Icons.notifications_active,
              title: "Notifications",
              trailing: Switch(
                value: notificationsEnabled,
                activeColor: Colors.teal,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            buildSettingTile(
              icon: Icons.language,
              title: "Language",
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  items: ['English', 'Urdu'].map((String lang) {
                    return DropdownMenuItem<String>(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                ),
              ),
            ),
            buildSettingTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              trailing: Switch(
                value: isDark,
                activeColor: Colors.teal,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
            buildSettingTile(
              icon: Icons.person,
              title: "Need Help?",
              trailing: Icon(Icons.help_center_outlined, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.feedback,
              title: "Feedback",
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.lock,
              title: "Privacy Policy",
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.info,
              title: "App Info",
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
