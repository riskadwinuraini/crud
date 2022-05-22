import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class EditData extends StatefulWidget{
  final List list;
  final int index;

  EditData({required this.list, required this.index, id});

  @override
  _EditDataState createState() => new _EditDataState();
  }

class _EditDataState extends State<EditData>{
  late TextEditingController controllerNama;
  late TextEditingController controllerTingkatan;
  late TextEditingController controllerTahunMasuk;
  late TextEditingController controllerTahunKeluar;

  void editData() async{
    http.put(
      Uri.parse('http://192.168.1.20:8080/api/api_pendidikan/' + widget.list[widget.index]['id'].toString()),
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "nama" : controllerNama.text,
        "tingkatan" : controllerTingkatan.text,
        "tahun_masuk" : controllerTahunMasuk.text,
        "tahun_keluar" : controllerTahunKeluar.text
      }).then((response){
        print('Response status : ${response.statusCode}');
        print('Response body : ${response.body}');
    });
  }

  void initState(){
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerTingkatan =
        new TextEditingController(text: widget.list[widget.index]['Tingkatan'].toString());
    controllerTahunMasuk =
        new TextEditingController(text: widget.list[widget.index]['Tahun Masuk'].toString());
    controllerTahunKeluar =
        new TextEditingController(text: widget.list[widget.index]['Tahun Keluar'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("EDIT DATA"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama",
                      labelText: "Nama"
                  ),
                ),
                new TextField(
                  controller: controllerTingkatan,
                  decoration: new InputDecoration(
                      hintText: "Tingkatan",
                      labelText: "Tingkatan"
                  ),
                ),
                new TextField(
                  controller: controllerTahunMasuk,
                  decoration: new InputDecoration(
                      hintText: "Tahun Masuk",
                      labelText: "Tahun Masuk"
                  ),
                ),
                new TextField(
                  controller: controllerTahunKeluar,
                  decoration: new InputDecoration(
                      hintText: "Tahun Keluar",
                      labelText: "Tahun Keluar"
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(10.0)
                ),
                new RaisedButton(
                    child: new Text("EDIT DATA"),
                    color: Colors.grey,
                    onPressed: (){
                      editData();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

}