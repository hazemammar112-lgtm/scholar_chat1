import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/screns/Chat_App.dart';
import 'package:scholar_chat/screns/login.dart';
import 'package:scholar_chat/screns/registar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(SholarChat());
}

class SholarChat extends StatelessWidget {
  const SholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
       routes: {
         Loginbage.id: (context) => Loginbage(),
         Registarbage.id: (context) => Registarbage(),
         ChatApp.id: (context) => ChatApp(),
       },
       home: Loginbage(),
    );
  }
}
