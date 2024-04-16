

import 'package:chat_app_final/auth/auth_service.dart';
import 'package:chat_app_final/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    // Add logout logic here

    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white, // Sets the text color to white
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true, // Centers the title within the AppBar
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout, color: Colors.white), // Optionally make logout icon white too
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

