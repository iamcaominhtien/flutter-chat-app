import 'package:chat_app/platforms/mobile/ui/session/login_screen.dart';
import 'package:chat_app/services/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserBaseScreen extends StatefulWidget {
  const UserBaseScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<UserBaseScreen> createState() => _UserBaseScreenState();
}

class _UserBaseScreenState extends State<UserBaseScreen> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //listen when user is signed out
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Helper.to(const LoginScreen(),
            finish: true,
            callBack: () {},
            arguments: {'sign-out': true});
        if (isUserLoggedIn==false) {
          isUserLoggedIn = true;
          Helper.notification(message: 'You have been signed out');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
