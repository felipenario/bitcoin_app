import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _bitcoin = "";

  void _verificarBitcoin() async{

    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String valorBitcoin = retorno["BRL"];

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
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset("imagens/bitcoin.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(_bitcoin),
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
            ),
          ],
        ),
      ),

    );
  }
}
