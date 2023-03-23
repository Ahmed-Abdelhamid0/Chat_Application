import 'package:chat_app/chat_buble/chat_buble.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  static String id='chatScreen';
  CollectionReference messages = FirebaseFirestore.
  instance.collection(messagesCollections);
  var textController=TextEditingController();
   final _controller= ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(
          dateTimeCreated ,
          descending: true).
           snapshots(),
        builder: (context,snapshot)
        {
         if(snapshot.hasData)
           {
             List<messageModel> messagesList =  [];
             for(int i=0 ; i < snapshot.data!.docs.length ; i++)
               {
                 messagesList.add(messageModel.
                 fromJson(snapshot.data!.docs[i]));
               }
             return Scaffold(

               appBar: AppBar(
                 automaticallyImplyLeading: false,
                 backgroundColor: primaryColor,
                 title: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:
                   [
                     Image(
                         height: 50.0,
                         image:
                         AssetImage(imageLogo2,)
                     ),
                     Text(
                       'Chat App',
                     ),
                   ],
                 ),
               ),
               body: Column(
                 children:
                 [
                   Expanded(
                     child: ListView.builder(
                       reverse: true,
                       controller: _controller,
                       itemCount:messagesList.length ,
                         itemBuilder: (context,index)
                         {
                           return messagesList[index].
                           id ==email?
                           ChatBuble(message: messagesList[index],
                           ): ChatBubleForFriend(message: messagesList[index]);
                         }
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: TextFormField(

                       controller: textController,
                       onFieldSubmitted: (value)
                       {
                         messages.add(
                       {
                         messageModels:value,
                         dateTimeCreated:DateTime.now(),
                         'id': email,
                       });
                         textController.clear();
                         _controller.jumpTo(0,
                           // duration: Duration(seconds: 10),
                           // curve: Curves.bounceInOut,
                         );

                       },
                       decoration: InputDecoration(
                         hintText: 'Send Meassage',
                         suffixIcon: Icon(
                           Icons.send,
                           color: primaryColor,
                         ),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16.0),
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16.0),
                           borderSide: BorderSide(
                             color: primaryColor,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.red),
                           borderRadius: BorderRadius.circular(16.0),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             );
           }else
             {
               return Text('Loading...');
             }
        }
    );
  }
}

