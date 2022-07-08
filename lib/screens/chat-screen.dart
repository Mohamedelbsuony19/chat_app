import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/models/message.dart';
import '../package/chat-buble.dart';

class chatScreen extends StatelessWidget {
  static const String routeName='chatScreen';
  final _contoroolar=ScrollController();
  CollectionReference message = FirebaseFirestore.instance.collection(kcollictionMessage);
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context){
  dynamic data;
  var email= ModalRoute.of(context)!.settings.arguments  ;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy(kcreatedtime,descending: true).snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<messageModell>listMesssage=[];
          for(int i=0; i<snapshot.data!.docs.length; i++){
            listMesssage.add(messageModell.fromJson(snapshot.data!.docs[i]));
          }
// BoxDecoration(
   //               image: DecorationImage(
 //                     image: AssetImage('assets/images/background.png'),
     //                 fit: BoxFit.fitWidth
       //           )
         //     ),

      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:kPrimarycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,  //
          children: [
          Image.asset(kLogo,height: 50,),
          Text('Scholar Chat')
        ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: (
            DecorationImage(image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fitWidth,
            
            )
          )
        ),
        child: Column(

          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _contoroolar,
                itemBuilder: (context,index){
                return listMesssage[index].usernmae==email ? chatBuble(message: listMesssage[index])
                :
                chatBubleForFrind(message: listMesssage[index])
                ;
              },itemCount: listMesssage.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: controller,
                onSubmitted: (data){
                  message.add({
                    'message':data,
                    kcreatedtime:DateTime.now() ,
                    kjsonNameUser:email
                  });
                  controller.clear();
                  _contoroolar.animateTo(
                    0,
                     duration:Duration(seconds: 1), 
                     curve: Curves.fastOutSlowIn);
                },
                decoration: InputDecoration(
                  hintText: 'Send message',
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      
                    },
                    child: Icon(Icons.send,color: Colors.white,)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimarycolor)
                  ),
                  
                ),
                
              ),
            )
          ],
        ),
      ),
    );}else {return ModalProgressHUD(
      inAsyncCall: true,
      child: Scaffold());}

      }
      );
     }
      
    
  }


