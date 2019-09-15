import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Map<String, dynamic> userlist;
  String checkUsername;
  String checkPassword;
  void initState() {
    // String username = "kshitij";
    // String password = "qwe";
    // final Map<String , String> user = {
    //   'username':username,
    //   'password': password
    // } ;
    // http.post('https://icasic-ceafd.firebaseio.com/users.json',body : json.encode(user)).then((http.Response response){
    //   print(json.decode(response.body));
    // });
    http
        .get('https://icasic-ceafd.firebaseio.com/users.json')
        .then((http.Response response) {
      print(json.decode(response.body));
      userlist = json.decode(response.body);
    });
  }

  bool auth() {
    bool check = false;
    userlist.forEach((String id, dynamic userdata) {
      print(userlist[id]['username']);
      print(userlist[id]['password']);
      print(checkUsername);
      print(checkPassword);
      if (userlist[id]['username'] == checkUsername &&
          userlist[id]['password'] == checkPassword) {
        print('SUCESS');
        check = true;
      }
    });
    if (check) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Builder(
        builder: (context2) => Scaffold(
              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromRGBO(255, 255, 255, 0.19),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'iCASIC2020',
                          style: TextStyle(
                            fontFamily: 'anton',
                            fontSize: 40.0,
                          ),
                        ),
                        Text(
                          'Conjunction Of Brilliance',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.amber,
                                // decoration: BoxDecoration(
                                //   image: DecorationImage(
                                //       image: AssetImage('assets/images/1.jpg'),
                                //       fit: BoxFit.fitHeight),
                                // ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 50, right: 50, top: 10, bottom: 10),
                                child: TextFormField(
                                  onSaved: (String value) {
                                    setState(() {
                                      checkUsername = value;
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    labelText: "Enter Username",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 50, right: 50, bottom: 10),
                                child: TextFormField(
                                  onSaved: (String value) {
                                    setState(() {
                                      checkPassword = value;
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(35.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          child: Text('LOGIN'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 3,
                          textColor: Colors.white,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {
                            _formkey.currentState.save();
                            if (auth()) {
                              print('check');
                              Navigator.push(
                                  context2,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(checkUsername)));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
