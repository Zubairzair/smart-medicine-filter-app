import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_pharmacy/loginpage.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  void signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup successful! Please login.")));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Signup failed")));
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.green, Colors.teal]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 80),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                _buildField("Email", Icons.email, false, emailController, validator: (value) {
                  if (value == null || !value.contains('@')) return 'Enter a valid email';
                  return null;
                }),
                const SizedBox(height: 20),
                _buildField("Password", Icons.lock, true, passwordController, validator: (value) {
                  if (value == null || value.length < 6) return 'Minimum 6 characters required';
                  return null;
                }),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: isLoading ? null : signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: isLoading ? CircularProgressIndicator() : Text("Sign Up"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: const Text("Already have an account? Login", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, IconData icon, bool isPassword, TextEditingController controller, {String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isObscure : false,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.white),
          onPressed: () => setState(() => isObscure = !isObscure),
        )
            : null,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
