import 'package:crud/editdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Detail extends StatefulWidget{
  List list;
  int index;
  Detail({
    Key? key,
    required this.list,
    required this.index,
  }) : super (key: key);
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State <Detail>{
  void deleteData(){
    var url = 'http://192.168.43.35:8080/api/api_pendidikan/';
    http.delete(Uri.parse(url + widget.list[widget.index]['id'].toString()),
    body: {
      'id' : widget.list[widget.index]['id'].toString()
    }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: [
        RaisedButton(
          child: Text(
            "OK DELETE!", style: new TextStyle(color: Colors.black),
          ),
            color: Colors.red,
            onPressed: (){
          deleteData();
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home()
          ));
        }),
        RaisedButton(
          child: Text("CANCEL", style: TextStyle(color: Colors.black),),
            color: Colors.green,
            onPressed: () => Navigator.pop(context)
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nama']}"),
      ),
      body: Container(
        height: 270.0,
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.0)
                ),
                Text(widget.list[widget.index]['nama'],
                style: new TextStyle(fontSize: 20.0),),
                Text("Tingkatan : ${widget.list[widget.index]['tingkatan']}",
                  style: TextStyle(fontSize: 18.0),),
                Text("Tahun Masuk : ${widget.list[widget.index]['tahun_masuk']}",
                  style: TextStyle(fontSize: 18.0),),
                Text("Tahun Keluar : ${widget.list[widget.index]['tahun_keluar']}",
                  style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      child: Text("EDIT"),
                        color: Colors.green,
                        onPressed: ()=>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => new EditData(
                              list: widget.list,
                              index: widget.index,
                            )
                            ))
                    ),
                    RaisedButton(
                      child: Text("DELETE"),
                        color: Colors.red,
                        onPressed: ()=> confirm()
                    )
                  ],
                )
              ],
            ),
          )
        )
      ),
    );
  }

}