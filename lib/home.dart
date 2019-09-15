import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:icasic19/directory.dart';
import 'package:icasic19/exhibitors.dart';
import 'package:icasic19/faq.dart';
import 'package:icasic19/partners.dart';
import 'package:icasic19/sessions.dart';
import 'package:icasic19/socialmedia.dart';
import 'package:icasic19/speaker.dart';

class HomePage extends StatefulWidget {
  String username;
  HomePage(this.username);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context3) => Scaffold(
              appBar: AppBar(
                title: const Text('iCASIC2020'),
                backgroundColor: Colors.black,
              ),
              body: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Sessions'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.mic),
                      title: Text('Speakers'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      title: Text('Partners'),
                    ),
                  ],
                ),
                tabBuilder: (BuildContext context, int index) {
                  assert(index >= 0 && index <= 2);
                  switch (index) {
                    case 0:
                      return new Sessions();
                      break;
                    case 1:
                      return new Speaker();
                      break;
                    case 2:
                      return new Partners();
                      break;
                  }
                  return null;
                },
              ),
              drawer: Drawer(
                child: Column(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.black),
                        accountName: new Text(
                          widget.username.toUpperCase(),
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        accountEmail: new Text(
                          "Strive for progress, not perfection.",
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        )),
                    ListTile(
                      leading: new Icon(Icons.book),
                      title: Text('Exhibitors'),
                      onTap: () {
                         Navigator.push(
                            context3,
                            MaterialPageRoute(
                                builder: (context3) => Exhibitors()));
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.chevron_right),
                      title: Text('Directory'),
                      onTap: () {
                        Navigator.push(
                            context3,
                            MaterialPageRoute(
                                builder: (context3) => Directory()));
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.favorite),
                      title: Text('FAQ'),
                      onTap: () {
                         Navigator.push(
                            context3,
                            MaterialPageRoute(
                                builder: (context3) => Faq()));
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.public),
                      title: Text('Social Media'),
                      onTap: () {
                         Navigator.push(
                            context3,
                            MaterialPageRoute(
                                builder: (context3) => SocialMedia()));
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
