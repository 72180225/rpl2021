import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rpl2021/dashboard.dart';
import 'package:rpl2021/pengajuanSK/sk.dart';

import 'KP/kp.dart';
import 'PRAKP/prakp.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    }
    catch(err){
      print(err);
    }

  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: _isLoggedIn
        ? SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 64,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          _googleSignIn.currentUser.photoUrl
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _googleSignIn.currentUser.displayName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            _googleSignIn.currentUser.email,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.deepPurple,
                                child: Text(
                                    'Pengajuan SK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )
                                ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PengajuanSk()),
                                );
                              },

                            )
                          ],
                        ),
                      ),

                      Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.deepPurple,
                                child: Text(
                                    'Pengajuan Kp',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )
                                ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PengajuanKp()),
                                );
                              },
                            )
                          ],
                        ),
                      ),

                      Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.deepPurple,
                                child: Text(
                                    'Pengajuan Pra Kp',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )
                                ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PengajuanPraKp()),
                                );
                              },
                            )
                          ],
                        ),
                      ),

                      Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.deepPurple,
                                child: Text(
                                    'Tanggal Ujian',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )
                                ),
                            ),

                          ],
                        ),
                      ),
                      Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.deepPurple,
                              child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )
                              ),
                              onPressed: (){
                                _logout();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // children: <Widget>[
          //   Image.network(
          //     _googleSignIn.currentUser.photoUrl,
          //     height: 50.0,
          //     width: 50.0,
          //   ),
          //   Text(_googleSignIn.currentUser.displayName),
          //   Text(_googleSignIn.currentUser.email),
          //   OutlineButton(
          //     child: Text("logOut"),
          //     onPressed: (){
          //       _logout();
          //
          //     },
          //   )
          // ],
        )
            : OutlineButton(
          child: Text("Login With Google"),
          onPressed: (){
            _login();
          },
        ),
      ),
    );
  }
}



