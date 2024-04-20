import 'package:chat_app_final/auth/auth_service.dart';
import 'package:chat_app_final/components/my_drawer.dart';
import 'package:chat_app_final/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void logout() {
    // Add logout logic here

    final auth = AuthService();
    auth.signOut();
  }

  // chat & auth service

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

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
            icon: Icon(Icons.logout,
                color: Colors.white), // Optionally make logout icon white too
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading ..

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading ..");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //dsiplay all users except current user

    if(userData["email"] !=_authService.getCurrentUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
              ),
            ),
          );
        },
      );
    } else{
      return Container();
    }
  }
}
