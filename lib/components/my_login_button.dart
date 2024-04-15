import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyLoginButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(Colors.teal)
        ),
        onPressed: onTap,
        child: Center(
          child: Text(text,
          style: TextStyle(color: Colors.black45)
          ),

        ),
        ),
      ),
    );
  }
}
