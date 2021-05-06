import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/pengajuanSK/listsk.dart';
import 'package:rpl2021/pengajuanSK/sk.dart';

import '../main.dart';
import 'adddataprakp.dart';
import 'detailprakp.dart';

class ListPraKp extends StatefulWidget {
  @override
  _ListPraKpState createState() => _ListPraKpState();
}



class _ListPraKpState extends State<ListPraKp> {
  Future<List> getDataPraKp() async{
    final response = await http.get("http://10.0.2.2/rpljaya_2021/getdataprakp.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Pra Kp"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder:(BuildContext context)=> new AddDataPraKp(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Surat Keterangan KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListSk()),
                );
              },

            ),
            ListTile(
              title: Text("Pengajuan Pra KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPraKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan Tanggal Ujian"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              title: Text("LogOut"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: new FutureBuilder<List>(
        future: getDataPraKp() ,
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
                    builder: (BuildContext context) => new DetailPraKp(list: list,index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.person),
                subtitle: new Text("Judul Pra Kp: ${list[i]['judul_prakp']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
