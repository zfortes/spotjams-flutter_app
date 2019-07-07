
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class pageSignUp extends StatefulWidget{
  @override

  _SignState createState() =>_SignState();
}


class _SignState extends State<pageSignUp>{

  String nome, cpf, data_nascimento, email, senha;

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override

  final _key = new GlobalKey<FormState>();

  checkC(){
    final form = _key.currentState;
    if(form.validate()) {
      form.save();
      cadastroH();
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Cadastro Realizado com Sucesso"),
          content: new Text("Por favor volte e faça o Login"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  cadastroH() async{
    final res = await http.get("http://10.0.2.2:2345?method=post&db=bd&operation=1&tabela=usuario&nome='$nome'&email='$email'&senha='$senha'&data_nascimento='$data_nascimento'&data_criacao_conta='$formattedDate'&cpf='$cpf'&cartao_credito=''");
    if(res.statusCode == 200){
      _showDialog();
      final data = jsonDecode(res.body);
      print(data);
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                width: 400.0,
                height: 60.0,
                child: Text(
                  ('Cadastro'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Arial', fontSize: 50.0, fontWeight: FontWeight.bold
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Por favor insira um Nome";
                }
              },
              onSaved: (e) => nome = e,
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome Completo",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Por favor insira um CPF";
                }
              },
              onSaved: (e) => cpf = e,
              autofocus: false,
              keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(11),
              ],
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Por favor insira uma data de nascimento";
                }
              },
              onSaved: (e) => data_nascimento = e,
              autofocus: false,
              keyboardType: TextInputType.datetime,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                labelText: "Data de Nascimento",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              validator: (e) =>
                !e.contains('@') ? "Por favor inserir um email válido" : null,
              onSaved: (e) => email = e,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Por favor insira uma senha";
                }
              },
              onSaved: (e) => senha = e,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF19B37A),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    checkC();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Voltar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}