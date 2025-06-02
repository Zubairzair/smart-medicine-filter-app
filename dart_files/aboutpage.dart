import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Smart Pharmacy',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // AppBar icon in white
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0f2027), Color(0xFF2c5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFb2ebf2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Smart Pharmacy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004d40),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Smart Pharmacy is a cutting-edge medical store management application '
                    'designed to simplify inventory, sales, expiry tracking, and medicine management. '
                    'It meets industry-level standards and provides a seamless experience for pharmacy owners.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30),
              Divider(
                color: Color(0xFF00796b),
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              SizedBox(height: 20),
              Text(
                'About Developer',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF004d40),
                ),
              ),
              SizedBox(height: 25),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: size.width * 0.95,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        child: Image(image: AssetImage('images/zair1.jpg.png')),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Muhammad Zubair',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004d40),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'App Developer & Designer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF004d40),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email, color: Color(0xFF00897b)),
                          SizedBox(width: 8),
                          Text(
                            'hafizzubair279@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF00796b),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, color: Color(0xFF00897b)),
                          SizedBox(width: 8),
                          Text(
                            '+92 328 1293271',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF00796b),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                '© 2025 Smart Pharmacy. All rights reserved.',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
