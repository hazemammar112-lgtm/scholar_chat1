
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/Wedget/Methods_error.dart';
import 'package:scholar_chat/screns/Chat_App.dart';
String? email;
  String? password;

///////////////////////////////////////////////////

void regesterErrormessage(BuildContext context, Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(( getErrorMessage(e.toString()))),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(16),
        duration: Duration(seconds: 3),
      ),
    );
  }



  /////////////////////////////////////////////////////////

  void RegesterSnacbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.white),
          SizedBox(width: 10),
          Text("تم التسجيل بنجاح"),
        ],
      ),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 1),
    ),
  );

  Future.delayed(const Duration(seconds: 1), () {
    // Navigator.pushNamed(context, ChatApp.id);
  },
  );
}





  void LoginSnacbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.white),
          SizedBox(width: 10),
          Text("تم التسجيل بنجاح"),
        ],
      ),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 1),
    ),
  );

  // Future.delayed(const Duration(seconds: 1), () {
  //   Navigator.pushNamed(context, ChatApp.id);
  // },
  // );
}

Future<void> regesterUser() async {
      UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
  ////////////////////////////////////////////