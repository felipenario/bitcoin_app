import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _bitcoin = "0";

  void _verificarBitcoin() async{

    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String valorBitcoin = retorno["BRL"]["buy"].toString();

    setState(() {
      _bitcoin = "${valorBitcoin}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("imagens/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                  "R\$"+_bitcoin,
                style: TextStyle(
                  fontSize: 35
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Atualizar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
              onPressed: (){
                _verificarBitcoin();
              },
              color: Colors.orange,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            ),
          ],
        ),
      ),

    );
  }
}
