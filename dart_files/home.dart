import 'package:flutter/material.dart';
import 'package:smart_pharmacy/aboutpage.dart';
import 'package:smart_pharmacy/contact.dart';
import 'package:smart_pharmacy/faq.dart';
import 'package:smart_pharmacy/notification.dart';
import 'package:smart_pharmacy/postmedicine.dart';
import 'package:smart_pharmacy/privacy.dart';
import 'package:smart_pharmacy/search_screen.dart';
import 'package:smart_pharmacy/settingpage.dart';
import 'package:smart_pharmacy/terms_and_conditions.dart';
import 'package:smart_pharmacy/view_update.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Zair Smart Pharmacy  ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, weight: 30),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal.shade200],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            drawerItem(Icons.add_circle_outline, 'Add Medicine'),
            drawerItem(Icons.list_alt, 'View Medicines'),
            drawerItem(Icons.warning_amber_rounded, 'Expiry Alerts'),
            drawerItem(Icons.bar_chart, 'Reports'),
            drawerItem(Icons.settings, 'Settings'),
            drawerItem(Icons.question_mark_outlined, 'FAQS'),
            Divider(),
            drawerItem(Icons.policy_outlined, 'Terms and Conditions'),
            drawerItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
            drawerItem(Icons.info_outline, 'About'),
            drawerItem(Icons.contact_page_outlined, 'Contact Us'),
          ],
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' 👋  Welcome Back! ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Search Box
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(searchQuery: value.trim()),
                      ),
                    ).then((_) {
                      // Clear the search field when returning back
                      _searchController.clear();
                      setState(() {}); // To refresh the UI
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search medicines...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Grid Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  buildFeatureCard(
                    Icons.add_circle_outline,
                    'Add Medicine',
                    Colors.green,
                  ),
                  buildFeatureCard(
                    Icons.list_alt,
                    'View Medicines',
                    Colors.blue,
                  ),
                  // buildFeatureCard(Icons.inventory_2, 'Low Stock', Colors.orange),
                  buildFeatureCard(
                    Icons.warning_amber_rounded,
                    'Expiry Alerts',
                    Colors.red,
                  ),
                  // buildFeatureCard(Icons.point_of_sale, 'Sell Medicine', Colors.teal),
                  buildFeatureCard(
                    Icons.bar_chart,
                    'Reports',
                    Colors.deepPurple,
                  ),
                  buildFeatureCard(Icons.settings, 'Settings', Colors.grey),
                  buildFeatureCard(
                    Icons.question_answer_outlined,
                    'FAQS',
                    Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewMedicine()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }

  Widget buildFeatureCard(IconData icon, String title, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (title == 'Add Medicine') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MedicineForm()),
            );
          } else if (title == 'View Medicines') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewMedicine()),
            );
          } else if (title == 'Expiry Alerts') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpiringMedicinesScreen(),
              ),
            );
          } else if (title == 'Reports') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewMedicine()),
            );
          } else if (title == 'Settings') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          } else if (title == 'FAQS') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQPage()),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 48, color: Colors.white),
                SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (title == 'Add Medicine') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicineForm()),
          );
        } else if (title == 'View Medicines') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewMedicine()),
          );
        } else if (title == 'Expiry Alerts') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpiringMedicinesScreen()),
          );
        } else if (title == 'Reports') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewMedicine()),
          );
        } else if (title == 'Settings') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        } else if (title == 'FAQS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQPage()),
          );
        } else if (title == 'Terms and Conditions') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
          );
        } else if (title == 'Privacy Policy') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
          );
        } else if (title == 'About') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutScreen()),
          );
        } else if (title == 'Contact Us') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsScreen()),
          );
        }
      },
    );
  }
}
