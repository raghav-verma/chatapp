import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:chat_app_final/models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        //return user

        return user;
      }).toList();
    });
  }

  //send message

  Future<void> sendMessage(String receiverID, message) async {
    //get current user info

    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    // create a new message

    Message newMessage = Message(
      senderID: currentUserEmail,
      senderEmail: currentUserID,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    //construct a chat room id for the two users( sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort();

    String chatRoomID = ids.join("_");

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());

    //add new messages to the database
  }

// get messages

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];

    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
