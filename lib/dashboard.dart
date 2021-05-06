import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl2021/KP/kp.dart';
import 'package:rpl2021/PRAKP/prakp.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'KP/detailkp.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer app"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.blue
                    : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Surat Keterangan KP"),
              trailing: Icon(Icons.arrow_forward),

            ),
            ListTile(
              title: Text("Pengajuan Pra KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PengajuanPraKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PengajuanKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan Tanggal Ujian"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Pengajuan Refrensi Lokasi Kp"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("LogOut"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),

      ),//this will just add the Navigation Drawer Icon
    );
  }
}