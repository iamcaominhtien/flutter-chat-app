import 'package:chat_app/platforms/mobile/ui/session/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///it is general helper class
class Helper {
  /// It navigates to the page passed as an argument.
  ///
  /// Args:
  ///   page (Widget): The page you want to navigate to.
  ///   arguments (Map<String, dynamic>): This is a Map<String, dynamic> that you
  /// can pass to the next page.
  ///   finish (bool): If true, it will finish all the previous pages and open the
  /// new page. Defaults to false
  static to(Widget page,
      {Map<String, dynamic>? arguments,
      bool finish = false,
      Function? callBack}) {
    if (finish == false) {
      Get.to(
        () => page,
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeft,
        arguments: arguments,
      )?.whenComplete(() => callBack?.call());
    } else {
      Get.offAll(
        () => page,
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeft,
        arguments: arguments,
      )?.whenComplete(() => callBack?.call());
    }
  }

  /// It shows a snackbar with the given message and title.
  ///
  /// Args:
  ///   title (String): The title of the snackbar.
  ///   message (String): The message you want to display.
  ///   type (int): 1: success, 2: error, 3: warning, 4: info. Defaults to 4
  ///   durationSecond (int): The duration of the snackbar in seconds. Defaults to 3
  static notification(
      {String? title,
      required String message,
      int type = 4,
      int durationSecond = 1}) {
    //type 1: success, 2: error, 3: warning, 4: info

    //if snackbar is already showing, dismiss it
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }

    Get.snackbar(
      title ??
          (type == 1
              ? "Success"
              : type == 2
                  ? "Error"
                  : type == 3
                      ? "Warning"
                      : "Notification"),
      message,
      colorText: Colors.black,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      isDismissible: true,
      // backgroundColor: type == 1
      //     ? Colors.green
      //     : type == 2
      //         ? Colors.red
      //         : type == 3
      //             ? Colors.orange
      //             : Colors.blue,
      // forwardAnimationCurve: Curves.easeOutBack,
      // reverseAnimationCurve: Curves.easeInBack,
      duration: Duration(seconds: durationSecond),
      animationDuration: const Duration(milliseconds: 400),
      icon: type == 4
          ? const Icon(
              Icons.notifications,
              color: Colors.black,
            )
          : type == 3
              ? const Icon(
                  Icons.warning,
                  color: Colors.black,
                )
              : type == 2
                  ? const Icon(
                      Icons.error,
                      color: Colors.black,
                    )
                  : type == 1
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
    );
  }

  /// It closes all snackbars and opens a loading dialog.
  static openLoading() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// check auth status
  static bool checkAuthStatus() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    return true;
  }
}
