import 'package:flutter/material.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/PRAKP/listprakp.dart';
import 'package:rpl2021/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class DetailPraKpMahasiswa extends StatefulWidget {
  List list;
  int index;
  DetailPraKpMahasiswa({this.index,this.list});
  @override
  _DetailPraKpMahasiswaState createState() => _DetailPraKpMahasiswaState();
}

class _DetailPraKpMahasiswaState extends State<DetailPraKpMahasiswa> {
  void deleteDataPraKp(){
    var url="http://10.0.2.2/rpljaya_2021/deletedataprakp.php";

    http.post(url, body: {
      "id_prakp" : widget.list[widget.index]['id_prakp']
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
            deleteDataPraKp();
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=>new ListPraKp()
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
        height: 350.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['nim'], style: new TextStyle(fontSize: 20.0),),
                new Text("Judul PRA KP : ${widget.list[widget.index]['judul_prakp']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Semester : ${widget.list[widget.index]['semester']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tahun : ${widget.list[widget.index]['tahun']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tools : ${widget.list[widget.index]['tools']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Lembaga : ${widget.list[widget.index]['lembaga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Pimpinan : ${widget.list[widget.index]['pimpinan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Alamat : ${widget.list[widget.index]['alamat']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Fax : ${widget.list[widget.index]['fax']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Status : ${widget.list[widget.index]['sk_prakp']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                // new Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     new RaisedButton(
                //       child: new Text("Edit"),
                //       color: Colors.green,
                //       onPressed: ()=>Navigator.of(context).push(
                //         new MaterialPageRoute(
                //             builder: (BuildContext context)=>new EditDataPraKp(list: widget.list, index: widget.index,)
                //         ),
                //       ),
                //     ),
                //     new RaisedButton(
                //       child: new Text("Delete"),
                //       color: Colors.red,
                //       onPressed: ()=>confirm(),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
