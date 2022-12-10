import 'package:chat_app/platforms/mobile/ui/base/base_screen.dart';
import 'package:chat_app/platforms/mobile/ui/session/sign_up_screen.dart';
import 'package:chat_app/platforms/mobile/ui/user/home_screen.dart';
import 'package:chat_app/services/helper/error_filter.dart';
import 'package:chat_app/services/helper/helper.dart';
import 'package:chat_app/services/session/manage_session.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SvgPicture.asset(
                            "assets/icon/svg/undraw_team_work_k-80-m.svg",
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.email),
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.lock),
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: login,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: signInWithGoogle,
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFFF1F5F6)),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            "assets/icon/svg/Google__G__Logo.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const Text(
                          "Login with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = goToSignUpScreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() {
    Helper.openLoading();
    ManageSession.signInWithGoogle().then((value) {
      Get.back();
      Helper.to(const HomeScreen(), finish: true);
    }).catchError((error) {
      if (error
          .toString()
          .contains("token is required")==false) {
        Get.back();
        Helper.notification(
            message: ErrorFilter.filterFirebaseAuthError(error.toString()));
      }
    });
  }

  void goToSignUpScreen() {
    Helper.to(SignUpScreen(key: UniqueKey()), finish: true);
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      Helper.openLoading();
      ManageSession.signInWithEmailPassword(
              _emailController.text, _passwordController.text)
          .then((value) {
        Get.back();
        Helper.to(const HomeScreen(), finish: true);
      }).catchError((error) {
        debugPrint("create error: $error");
        Get.back();
        Helper.notification(
            message: ErrorFilter.filterFirebaseAuthError(error));
      });
    }
  }
}
