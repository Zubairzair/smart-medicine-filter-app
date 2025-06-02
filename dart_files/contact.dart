import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF004d40),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF004d40), Color(0xFF00796b)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('images/zair1.jpg.png'),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Muhammad Zubair Zair',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'App Developer & Web Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Email Row - spacing adjusted
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 5),  // reduced spacing
                      Text(
                        'hafizzubair279@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 3),

                  // Phone Row - spacing adjusted & line height normal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(width: 5),  // reduced spacing
                      Text(
                        '+92 328 1293271',
                        style: TextStyle(color: Colors.white, height: 1.2),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Form Section
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField(
                    label: 'Your Name',
                    icon: Icons.person,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter your name' : null,
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    label: 'Your Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    label: 'Your Message',
                    icon: Icons.message,
                    maxLines: 4,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter your message' : null,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004d40),  // Dark green like card background
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    icon: Icon(Icons.send, color: Colors.white),
                    label: Text(
                      'Send Message',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Your message has been sent!'),
                            backgroundColor: Colors.teal[600],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text(
              '© 2025 Smart Pharmacy',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
