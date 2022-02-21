import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

const webScreenSize = 600;
final homeScreenItems = [
  FeedScreen(),
  Text("Search"),
  AddPostScreen(),
  Text("Favorite"),
  Text("Profile")
];
