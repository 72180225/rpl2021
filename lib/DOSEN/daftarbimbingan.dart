import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/PRAKP/listprakp.dart';
import 'package:rpl2021/main.dart';

import 'detailbimbingan.dart';


class DaftarBimbingan extends StatefulWidget {
  @override
  _DaftarBimbinganState createState() => _DaftarBimbinganState();
}



class _DaftarBimbinganState extends State<DaftarBimbingan> {
  Future<List> getDataKp() async{
    final response = await http.get("http://10.0.2.2/rpljaya_2021/getdatakp.php");
    return json.decode(response.body);
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool _isLoggedIn = false;

  _logout() async{
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => LoginPage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Bimbingan"),
      ),
      // floatingActionButton: new FloatingActionButton(
      //   child: new Icon(Icons.add),
      //   onPressed: ()=>Navigator.of(context).push(
      //     new MaterialPageRoute(
      //       builder:(BuildContext context)=> new AddDataKp(),
      //     ),
      //   ),
      // ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 270,
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Daftar Bimbingan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => DaftarBimbingan()
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Melihat Jadwal Ujian'),
              onTap: () {

              },
            ),
            SizedBox(
              height: 250,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                _logout();
              },
            ),
          ],
        ),
      ),
      body: new FutureBuilder<List>(
        future: getDataKp() ,
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data,) : new Center(child: new CircularProgressIndicator(),);
        },
      ),//this will just add the Navigation Drawer Icon
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i ) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new DetailBimbingan(list: list,index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.person),
                subtitle: new Text("Judul : ${list[i]['judul_kp']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
