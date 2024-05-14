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

  Map<String, dynamic> toMap() => <String, dynamic>{
  campo_id: id,
  email: email,
  senha: senha, 
  nome: nome,
  celular: celular,
  cpf: cpf 
 };

 factory cadastro.fromMap(Map<String, dynamic> map) => cadastro(
  id: map[campo_id] is int ? map[campo_id]: null,
  email: map[Email] is String ? map[Email] : '',
  senha: map[Senha] is String ? map[Senha] : '',
  nome: map[Nome] is String ? map[  Nome] : '',
  celular: map[Celular] is String ? map[Celular] : '',
  cpf: map[Cpf] is String ? map[Cpf] : '',
 );
}