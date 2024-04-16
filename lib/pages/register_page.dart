
import 'package:flutter/material.dart';

import 'package:chat_app_final/components/text_field.dart';
import '../components/my_login_button.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
   final TextEditingController _confirmPwController = TextEditingController();

  void register(){}

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
                onTap: register,
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
