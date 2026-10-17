import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Wedget/Custem_Botten.dart';
import 'package:scholar_chat/Wedget/Custem_TextFeld.dart';
import 'package:scholar_chat/Wedget/Show_SnackBar.dart';
import 'package:scholar_chat/Wedget/consts.dart';
import 'package:scholar_chat/screns/Chat_App.dart';
import 'package:scholar_chat/screns/registar.dart';


class Loginbage extends StatefulWidget {
  Loginbage({super.key});

  static const String id = "Loginbage";

  @override
  State<Loginbage> createState() => _LoginbageState();
}

class _LoginbageState extends State<Loginbage> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;

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
                      "Login",
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
                  OnTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await regesterUser();
                        LoginSnacbar(context);
                        Navigator.pushNamed(context, ChatApp.id, arguments: email);
                      } on FirebaseAuthException catch (e) {
                        regesterErrormessage(context, e);
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  Text1: "login",
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
                        Navigator.pushNamed(
                          context,
                          Registarbage.id,
                         
                        );
                      },
                      child: Text(
                        "register",
                        style:
                            TextStyle(color: Color(0xffD4F0F0), fontSize: 20),
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
