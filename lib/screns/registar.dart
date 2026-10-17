import 'package:flutter/material.dart';
import 'package:scholar_chat/Wedget/Custem_Botten.dart';
import 'package:scholar_chat/Wedget/Custem_TextFeld.dart';
import 'package:scholar_chat/Wedget/Show_SnackBar.dart';
import 'package:scholar_chat/Wedget/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/screns/Chat_App.dart';

class Registarbage extends StatefulWidget {
  Registarbage({
    super.key,
  });
  static const String id = "Registarbage";

  @override
  State<Registarbage> createState() => _RegistarbageState();
}

class _RegistarbageState extends State<Registarbage> {
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
          backgroundColor: primarykey,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sholar Chat",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustemTextfeld(
                    OnChanged: (data) {
                      email = data;
                    },
                    HitnText: "Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustemTextfeld(
                    OnChanged: (data) {
                      password = data;
                    },
                    HitnText: "password",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustemBotten(
                    Text1: "register",
                    OnTap: () async {
                      if (formkey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await regesterUser();
                          RegesterSnacbar(context);

                          Navigator.pushNamed(context, ChatApp.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          regesterErrormessage(context, e);
                        }
                        isloading = false;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "dont have are acount? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "login",
                          style:
                              TextStyle(color: Color(0xffD4F0F0), fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
