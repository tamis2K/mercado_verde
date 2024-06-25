import 'package:intl/intl.dart';

class cadastro {
  static const nome_tabela = 'cadastro';
  static const campo_id  = '_id';
  static const Email = 'email';
  static const Senha = 'senha';
  static const Nome = 'nome';
  static const Celular  = 'celular';
  static const Cpf  = 'cpf';



  int? id;
  String email;
  String senha;
  String nome;
  String celular;
  String cpf; 

  cadastro({
    required this.id,
    required this.email,
    required this.senha,
    required this.nome,
    required this.celular,
    required this.cpf
  });
  
}