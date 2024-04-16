
import 'package:chat_app_final/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat_app_final/components/text_field.dart';
import '../components/my_login_button.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
   final TextEditingController _confirmPwController = TextEditingController();

  void register(BuildContext context){
    //get auth service
     final _auth  = AuthService();
     if(_pwController.text == _confirmPwController.text) {
       try {
         _auth.signUpWithEmailPassword(
           _emailController.text,
           _pwController.text,
         );
       } catch (e) {
         showDialog(
           context: context,
           builder: (context) =>
               AlertDialog(
                 title: Text(e.toString()),
               ),
         );
       }
     }

       else{

       showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: Text("Passwords do not match!"),
         ),
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
              Icon(Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 40,),
              Text("Let's create an account for you ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary,
                    fontSize: 16),

              ),

              SizedBox(height: 20,),
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

              SizedBox(height: 10,),



              MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _confirmPwController,
              ),

              SizedBox(height: 25,),

              MyLoginButton(
                text: 'Register',
                onTap: ()=> register(context),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Text('Already have an account? '),

                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,'/loginPage');
                    },
                    child: Text(
                      'Login Now',
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
