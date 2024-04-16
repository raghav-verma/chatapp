 import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
   const MyDrawer({super.key});

   void logout() {
     // Add logout logic here

     final _auth = AuthService();
     _auth.signOut();
   }

   @override
   Widget build(BuildContext context) {
     return Drawer(
       backgroundColor: Theme.of(context).colorScheme.background,
       child: Column (
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Column(
             children: [
               const SizedBox(height: 80,),
               const Icon(Icons.message,size: 60,
               color: Colors.grey,
               ),
                const SizedBox(height : 50),
               ListTile(
                 title: Text("H O M E"),
                 leading: Icon(Icons.home,
                 size: 20,),
                 onTap: () {
                   //pop the drawer
                   Navigator.pop(context);

                 },
               ),

               ListTile(
                 title: Text("S E T T I N G S"),
                 leading: Icon(Icons.settings, size: 20,),
                 onTap: () {
                   //pop the drawer
                   // Navigator.pop(context);

                   // navigate to settings page
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => SettingsPage()
                     )
                   );
                 },
               ),
             ],
           ),



           Padding(
             padding: const EdgeInsets.only(bottom: 20.0),
             child: ListTile(
               title: Text("L O G O U T"),
               leading: Icon(Icons.logout, size: 20,),
               onTap: logout,
             ),
           )


         ],
       )
     );
   }
 }
