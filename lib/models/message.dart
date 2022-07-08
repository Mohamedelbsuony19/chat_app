import 'package:scholar_chat/constans.dart';

class messageModell{
   final String TextMessage;
   final String usernmae;

  messageModell(this.TextMessage,this.usernmae);

  factory messageModell.fromJson(jsonDta){
  return messageModell(jsonDta[kjsonMesaage],jsonDta[kjsonNameUser]);
  }
}