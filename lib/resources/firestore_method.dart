import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/model/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods extends StorageMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String postId = const Uuid().v1();
  //upload post
  Future<String> uploadPost(String description, String uid, String username,
      Uint8List file, String profileImage) async {
    try {
      String photoUrl = await uploadImageToStorage('posts', file, bool, true);
      Post post = Post(
          description: description,
          uId: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profileImage: profileImage,
          likes: []);

      _firestore.collection('posts').doc(postId).set(post.toJson());
      return "Success";
    } on FirebaseException catch (err) {
      debugPrint(err.message.toString());
      return err.message.toString();
    } catch (e) {
      debugPrint(e.toString());
      return "Somthinf went to wrong";
    }
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {} catch (e) {
      debugPrint(e.toString());
    }
  }
}
