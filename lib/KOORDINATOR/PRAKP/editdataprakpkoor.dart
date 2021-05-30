import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl2021/KOORDINATOR/PRAKP/listprakpkoor.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/PRAKP/listprakp.dart';

import 'detailprakpkoor.dart';

class EditDataPraKpKoor extends StatefulWidget {
  final List list;
  final int index;
  EditDataPraKpKoor({this.index,this.list});

  @override
  _EditDataPraKpKoorState createState() => _EditDataPraKpKoorState();
}

class _EditDataPraKpKoorState extends State<EditDataPraKpKoor> {
  TextEditingController controlleridprakp;
  TextEditingController controllersemester;
  TextEditingController controllertahun;
  TextEditingController controllernim;
  TextEditingController controllerjudulprakp;
  TextEditingController controllertools;
  TextEditingController controllerlembaga;
  TextEditingController controllerpimpinan;
  TextEditingController controlleralamat;
  TextEditingController controllerfax;
  TextEditingController controllerskprakp;

  void editDataPraKp(){
    var url="http://10.0.2.2/rpljaya_2021/editdataprakp.php";
    http.post(url, body: {
      "id_prakp": widget.list[widget.index]['id_prakp'],
      "semester": controllersemester.text,
      "tahun": controllertahun.text,
      "nim": controllernim.text,
      "judul_prakp": controllerjudulprakp.text,
      "tools": controllertools.text,
      "lembaga": controllerlembaga.text,
      "pimpinan": controllerpimpinan.text,
      "alamat": controlleralamat.text,
      "fax": controllerfax.text,
      "sk_prakp": controllerskprakp.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controllersemester = new TextEditingController(text: widget.list[widget.index]['semester']);
    controllertahun = new TextEditingController(text: widget.list[widget.index]['tahun']);
    controllernim = new TextEditingController(text: widget.list[widget.index]['nim']);
    controllerjudulprakp = new TextEditingController(text: widget.list[widget.index]['judul_prakp']);
    controllertools = new TextEditingController(text: widget.list[widget.index]['tools']);
    controllerlembaga = new TextEditingController(text: widget.list[widget.index]['lembaga']);
    controllerpimpinan = new TextEditingController(text: widget.list[widget.index]['pimpinan']);
    controlleralamat = new TextEditingController(text: widget.list[widget.index]['alamat']);
    controllerfax = new TextEditingController(text: widget.list[widget.index]['fax']);
    controllerskprakp = new TextEditingController(text: widget.list[widget.index]['sk_prakp']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllersemester,
                  decoration: new InputDecoration(
                    hintText: "Semester",
                    labelText: "Semester",
                  ),
                ),
                new TextField(
                  controller: controllertahun,
                  decoration: new InputDecoration(
                    hintText: "Tahun",
                    labelText: "Tahun",
                  ),
                ),
                new TextField(
                  controller: controllernim,
                  decoration: new InputDecoration(
                    hintText: "Nim",
                    labelText: "Nim",
                  ),
                ),
                new TextField(
                  controller: controllerjudulprakp,
                  decoration: new InputDecoration(
                    hintText: "Judul Pra Kp",
                    labelText: "Judul Pra Kp",
                  ),
                ),
                new TextField(
                  controller: controllertools,
                  decoration: new InputDecoration(
                    hintText: "Tools",
                    labelText: "Tools",
                  ),
                ),
                new TextField(
                  controller: controllerlembaga,
                  decoration: new InputDecoration(
                    hintText: "Lembaga",
                    labelText: "Lembaga",
                  ),
                ),
                new TextField(
                  controller: controllerpimpinan,
                  decoration: new InputDecoration(
                    hintText: "Pimpinan",
                    labelText: "Pimpinan",
                  ),
                ),
                new TextField(
                  controller: controlleralamat,
                  decoration: new InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                  ),
                ),
                new TextField(
                  controller: controllerfax,
                  decoration: new InputDecoration(
                    hintText: "Fax",
                    labelText: "Fax",
                  ),
                ),
                new TextField(
                  controller: controllerskprakp,
                  decoration: new InputDecoration(
                    hintText: "SK KP",
                    labelText: "SK KP",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),

                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    editDataPraKp();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(BuildContext context)=>new ListPraKpKoor()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
