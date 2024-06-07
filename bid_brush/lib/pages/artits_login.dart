import 'package:bid_brush/pages/artist_home.dart';
import 'package:bid_brush/pages/artist_signup.dart';
import 'package:bid_brush/pages/forgot.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _showErrorDialog(String message) {
    // Implement your error handling logic here (e.g., using SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.grey,
      ),
    );
  }

  // State variables
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // Firebase authentication instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtistLogin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            // Password field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Login button
            ElevatedButton(
              onPressed: isLoading ? null : () => _loginWithEmailAndPassword(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40.0),
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: Text(isLoading ? 'Loading...' : 'Login'),
            ),
            const SizedBox(height: 6.0),
            const SizedBox(height: 6.0),
            // Forgot password link
            TextButton(
              onPressed: () {
                // Handle forgot password action (e.g., navigate to password reset page)
                Get.to(
                    const Forgot()); // Assuming a forgot password page exists
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.purple),
              ),
            ),

            const SizedBox(height: 20.0),

            // Google Sign-In button
            ElevatedButton(
              onPressed: () {
                _handleSignIn();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 40.0),
                side: const BorderSide(color: Colors.purple),
              ),
              // ignore: prefer_const_constructors
              child: Text('Sign In with Google'),
            ),
            // ... existing code

            TextButton(
              onPressed: () {
                Get.to(const ArtistSignUp());
              }, // Replace with your signup page route
              child: const Text(
                'Create New Account',
                style: TextStyle(color: Colors.purple),
              ),
            ),

// ... existing code
          ],
        ),
      ),
    );
  }

  Future<void> _loginWithEmailAndPassword() async {
    setState(() {
      isLoading = true; // Indicate loading state
    });

    try {
      // Successful login, proceed to home page
      if(Firebase.apps.isEmpty)
        {
          await Firebase.initializeApp();
        }
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print('object========$credential');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const ArtistHome()), // Assuming HomePage exists
      );
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred: ${e.code}";
      if (e.message != null) {
        message += "\n${e.message}";
      }
      _showErrorDialog(message);
// Use a more user-friendly approach (e.g., SnackBar)
    } finally {
      setState(() {
        isLoading = false; // Reset loading state
      });
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
       clientId: 'your-client_id.apps.googleusercontent.com',
      //scopes: scopes,
      );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((value) {
        Get.offAll(const ArtistHome());
      });
    } catch (error) {
      print("error =================>$error");
    }
  }
}
