import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class AddData extends StatefulWidget{
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerTingkatan = new TextEditingController();
  TextEditingController controllerTahunMasuk = new TextEditingController();
  TextEditingController controllerTahunKeluar = new TextEditingController();

  void addData(){
    var url = "http://192.168.1.20:8080/api/api_pendidikan/";

    http.post(Uri.parse(url), body:{
      "nama" : controllerNama.text,
      "tingkatan" : controllerTingkatan.text,
      "tahun_masuk" : controllerTahunMasuk.text,
      "tahun_keluar" : controllerTahunKeluar.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new TextField(
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
              child: new Text("ADD DATA"),
                color: Colors.grey,
                onPressed: (){
                addData();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                })
          ],
        ),
      ),
    );
  }

}