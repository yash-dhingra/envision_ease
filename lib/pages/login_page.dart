// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

import 'package:envision_ease/Components/my_button.dart';
import 'package:envision_ease/Components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo

              Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),

              //welcome back
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),

              //Username

              MyTextField(
                controller: _emailController,
                hintText: 'Email Id',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //Password
              MyTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              //Sign in button
              MyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
