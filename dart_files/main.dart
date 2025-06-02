import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_pharmacy/splash.dart';
import 'firebase_options.dart';
import 'home.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(zair_smartpharmacy());
}
class zair_smartpharmacy extends StatefulWidget {
  const zair_smartpharmacy({super.key});

  @override
  State<zair_smartpharmacy> createState() => _zair_smartpharmacyState();
}

class _zair_smartpharmacyState extends State<zair_smartpharmacy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
