import 'package:flutter/material.dart';

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
      body: Text('THIS IS THE SOCIAL MEDIA PAGE'),
    );
  }
}
