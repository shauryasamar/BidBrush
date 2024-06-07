import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'choose_login_type.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: 'Shivam Kumar'); // Pre-fill name
    final emailController = TextEditingController(text: 'shivam@gmail.com'); // Pre-fill email
    final addressController = TextEditingController(text: 'Bengaluru, India'); // Pre-fill address
    final phoneController = TextEditingController(text: '9149698655');

    return Scaffold(
      // Removed app bar//
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile picture section with border
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 5.0),
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/icons/img.png'),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),

              // User information section with bolder username
              // Name field
              // User information section with bolder username
              const Text(
                'User Information',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Name field
              TextField(
                controller: nameController,
                enabled: false,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple), // Bold and dark label
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple, width: 2.0)), // Bold and dark border
                ),
              ),
              const SizedBox(height: 20.0),

              // Email field
              TextField(
                controller: emailController,
                enabled: false,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple, width: 2.0)),
                ),
              ),
              const SizedBox(height: 20.0),

              // Address field
              TextField(
                controller: addressController,
                enabled: false,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                maxLines: null, // Allow multiple lines for address
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple, width: 2.0)),
                ),
              ),
              const SizedBox(height: 20.0),

              TextField(
                controller: phoneController,
                enabled: false,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                maxLines: null, // Allow multiple lines for address
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple, width: 2.0)),
                ),
              ),
              const SizedBox(height: 40.0),

              // Sign out button with rounded corners
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const ChooseLoginType());
                    print('Signing Out...');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    elevation: 20.0, // Remove default shadow
                  ),
                  child: const Text('Sign Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}