import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_app/screen/admin_page.dart';
import 'package:push_notification_app/screen/home_page.dart';
import 'package:push_notification_app/screen/login_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              User? user = snapshot.data;
              if (user!.email == 'asif@gmail.com' &&
                  passwordMatches(user, 'asif12345')) {
                return AdminPage();
              } else {
                return HomePage();
              }
            } else {
              return Login();
            }
          }),
    );
  }
}

bool passwordMatches(User user, String password) {
  return password == 'asif12345';
}
