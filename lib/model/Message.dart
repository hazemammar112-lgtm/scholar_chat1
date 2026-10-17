import 'package:scholar_chat/Wedget/consts.dart';

class Messege {
  String messege;
  String? id;

  Messege(
  this.messege,
  this.id
  );
  factory Messege.fromJson( jsondata) {
    return Messege ( jsondata[Kmessage], jsondata[Kid]);
  }
}



