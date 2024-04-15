import 'package:chat_app_final/auth/auth_service.dart';
import 'package:chat_app_final/components/my_login_button.dart';
import 'package:chat_app_final/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

//login method
  void login(BuildContext context) async{
    // get auth service

    final authService = AuthService();

    // try login


    try{
        await authService.signInWithEmailPassword(_emailController.text, _pwController.text,);
      
    }
    
    catch(e){

      print('Error: ${e.toString()}'
      );
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.add_call,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),
           SizedBox(height: 50,),
            Text("Welcome back, you've been missed! ",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16),

            ),

            SizedBox(height: 50,),
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            SizedBox(height:10,),
            MyTextField(
                hintText: 'Password',
              obscureText: true,
              controller: _pwController,
            ),

            SizedBox(height: 25,),


            MyLoginButton(
            text: 'Login',
              onTap: () => login(context),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                Text('Not a member?'),

                InkWell(
                  onTap: (){Navigator.pushNamed(context, "/registerPage");
                  },

                  child: Text(
                      'Register Now',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            // Text('Not a member? Register Now'),

            //welcome back message

            // email text field

            // pw text field

            // login button

            //register now


            //
          ],
        ),
      )
    );
  }
}
