import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/Wedget/consts.dart';
import 'package:scholar_chat/Wedget/Custom_ChatApp.dart';
import 'package:scholar_chat/model/Message.dart';

class ChatApp extends StatelessWidget {
  static String id = "ChatApp";
  final controlarler = ScrollController();

  CollectionReference messeges =
      FirebaseFirestore.instance.collection(KmessageCollection);
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
   
    return StreamBuilder<QuerySnapshot>(
      stream: messeges.orderBy(KCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messege> messegesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messegesList.add(
              Messege.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: primarykey,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Kliogo,
                    height: 50,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: controlarler,
                    itemCount: messegesList.length,
                    itemBuilder: (context, index) {
                      return messegesList[index].id == email
                          ? Custom_ChatApp2(message: messegesList[index])
                          : Custom_ChatApp(message: messegesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (data) {
                      sendmessage(data, email);
                    },
                    decoration: InputDecoration(
                      hintText: "Send a message",
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendmessage(messageController.text, email);
                        },
                        icon: Icon(
                          Icons.send,
                          color: primarykey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: primarykey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: primarykey,
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: primarykey,
              ),
            ),
          );
        }
      },
    );
  }




  /////////////////////////////////////////  star send message to firebase
 void sendmessage(String data, Object? email) {
     messeges.add({
      Kmessage: data,
      KCreatedAt: DateTime.now(),
      "id": email,
    });
    messageController.clear();
    controlarler.animateTo(
      0,
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
    messageController.clear();
  }
  //////////////////////////////////////////  end send message to firebase
 
}
