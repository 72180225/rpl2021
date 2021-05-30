import 'package:flutter/material.dart';
import 'package:rpl2021/KOORDINATOR/SK/listskkoor.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/PRAKP/listprakp.dart';
import 'package:rpl2021/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rpl2021/pengajuanSK/listsk.dart';

import 'editdataskkoor.dart';

class DetailSkKoor extends StatefulWidget {
  List list;
  int index;
  DetailSkKoor({this.index,this.list});
  @override
  _DetailSkKoorState createState() => _DetailSkKoorState();
}

class _DetailSkKoorState extends State<DetailSkKoor> {
  void deleteDataSk(){
    var url="http://10.0.2.2/rpljaya_2021/deletedatask.php";

    http.post(url, body: {
      "id_sk" : widget.list[widget.index]['id_sk']
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Tolak data ini?'${widget.list[widget.index]['nim']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OKE TOLAK"),
          color: Colors.red,
          onPressed: (){
            deleteDataSk();
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=>new ListSkKoor()
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL"),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nim']}")),
      body: new Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['nim'], style: new TextStyle(fontSize: 20.0),),
                new Text("Semester : ${widget.list[widget.index]['semester']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tahun : ${widget.list[widget.index]['tahun']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Lembaga : ${widget.list[widget.index]['lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Pimpinan : ${widget.list[widget.index]['pimpinan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("No Telpon : ${widget.list[widget.index]['no_telp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Alamat : ${widget.list[widget.index]['alamat']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Fax : ${widget.list[widget.index]['fax']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Surat : ${widget.list[widget.index]['surat']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.yellow,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>new EditDataSkKoor(list: widget.list, index: widget.index,)
                        ),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("TOLAK"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                    new RaisedButton(
                      child: new Text("TERIMA"),
                      color: Colors.green,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
