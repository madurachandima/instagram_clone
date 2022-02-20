import 'package:cloud_firestore/cloud_firestore.dart';

class User {
//     'username': username,
//           'uid': cred.user!.uid,
//           'bio': bio,
//           'followers': [],
//           'following': [],
//           'imageUrl': imageUrl
  final String? email;
  final String? uId;
  final String? imageUrl;
  final String? username;
  final String? bio;
  final List? followers;
  final List? following;

  const User({
    required this.email,
    required this.uId,
    required this.imageUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'uid': uId,
        'bio': bio,
        'followers': followers,
        'following': following,
        'imageUrl': imageUrl
      };

  static User fromSnap(DocumentSnapshot? snap) {
    var snapshot = snap!.data() as Map<String, dynamic>;
  
    return User(
        email: snapshot['email'],
        uId: snapshot['uid'],
        imageUrl: snapshot['imageUrl'],
        username: snapshot['username'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
