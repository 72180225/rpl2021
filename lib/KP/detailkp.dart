import 'package:flutter/material.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/main.dart';
import 'package:http/http.dart' as http;

import 'editdatakp.dart';

class DetailKp extends StatefulWidget {
  List list;
  int index;
  DetailKp({this.index,this.list});
  @override
  _DetailKpState createState() => _DetailKpState();
}

class _DetailKpState extends State<DetailKp> {
  void deleteData(){
    var url="http://10.0.2.2/rpljaya_2021/deletedatakp.php";

    http.post(url, body: {
      "id_kp" : widget.list[widget.index]['id_kp']
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Hapus data ini?'${widget.list[widget.index]['nim']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OKE DELETE"),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=>new ListKp()
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
                new Text("Judul KP : ${widget.list[widget.index]['judul_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Semester : ${widget.list[widget.index]['semester']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tahun : ${widget.list[widget.index]['tahun']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tools : ${widget.list[widget.index]['tools']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Lembaga : ${widget.list[widget.index]['lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Pimpinan : ${widget.list[widget.index]['pimpinan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Alamat : ${widget.list[widget.index]['alamat']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Fax : ${widget.list[widget.index]['fax']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Status : ${widget.list[widget.index]['sk_kp']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>new EditDataKp(list: widget.list, index: widget.index,)
                        ),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.red,
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
