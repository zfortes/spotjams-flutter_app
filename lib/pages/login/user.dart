import 'dart:core';

class User {
  String id;
  String nome;
  String emaillog;
  String cpf;
  String data_nascimento;
  String data_criacao_conta;



  void setUser(String id, String nome, String emaillog, String cpf, String data_nascimento, String data_criacao_conta){
    this.id = id;
    this.nome = nome;
    this.emaillog = emaillog;
    this.cpf = cpf;
    this.data_nascimento = data_nascimento;
    this.data_criacao_conta = data_criacao_conta;
  }
}