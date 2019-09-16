import 'package:flutter/material.dart';
import 'package:icasic19/social_icons.dart';

class SocialMedia extends StatefulWidget {
  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Social Media'),
      ),
      body: Icon(Social.facebook),
    );
  }
}
