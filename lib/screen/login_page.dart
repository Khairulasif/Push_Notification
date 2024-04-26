import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:push_notification_app/screen/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void subscribeToTopic() {
    FirebaseMessaging.instance.subscribeToTopic('all_users');
    print(".............Topic..........");
  }

  signin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    subscribeToTopic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.lock_outlined),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: (() => signin()),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Dont have an account?"),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: (() => Get.to(Signup())),
                    child: Text("Register Now"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
