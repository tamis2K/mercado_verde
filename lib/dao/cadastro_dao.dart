import 'package:mercado_verde/database/database_provider.dart';
import 'package:mercado_verde/model/cadastro_dao.dart';


class cadastroDAO {

  final dbProvider = DatabaseProvider.instance;

  Future<bool> salvar(cadastro cadastros) async{
    final db = await dbProvider.database;
    final valores = cadastros.toMap();
    if(cadastros.id == null){
      cadastros.id = await db.insert(cadastro.nome_tabela, valores);
      return true;
    }else {
      final registrosAtualizados = await db.update(
          cadastro.nome_tabela, valores,
          where: '${cadastro.campo_id} = ?',
          whereArgs: [cadastros.id]);

      return registrosAtualizados > 0;
    }
  }

  Future<List<cadastro>> Lista({
    String filtro = '',
    String campoOrdenacao = cadastro.campo_id,
    bool usarOrdemDecrescente = false,
}) async{
    final db = await dbProvider.database;

    String? where;
    if(filtro.isNotEmpty){
      where = "UPPER(${cadastro.Senha}) LIKE '${filtro.toUpperCase()}%'";
    }

    var orderBy= campoOrdenacao;
    if (usarOrdemDecrescente){
      orderBy += ' DESC';
    }

    final resultado = await db.query(cadastro.nome_tabela,
    columns: [],
      where: where,
      orderBy: orderBy,
    );
    return resultado.map((m) => cadastro.fromMap(m)).toList();
  }

}