import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/model/user.dart' as model;
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    // print(currentUser.uid);
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    // print(snap.get("email"));
    return model.User.fromSnap(snap);
  }

  Future<String> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //upload profile image
        String imageUrl = await StorageMethods()
            .uploadImageToStorage("profileImages", file, bool, false);

        model.User user = model.User(
            username: username,
            email: email,
            uId: cred.user!.uid,
            bio: bio,
            followers: [],
            following: [],
            imageUrl: imageUrl);
        // add user to database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "Success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        // handel error
      }
      res = err.message!;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        return "Success";
      } else {
        return "Email address or Password is empty";
      }
    } on FirebaseException catch (err) {
      return err.message.toString();
    } catch (e) {
      debugPrint(e.toString());
      return "Somthing is wrong";
    }
  }
}
