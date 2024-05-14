import 'package:mercado_verde/model/cadastro_dao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static const _dbName = 'cadastro_tarefas.db';
  static const _dbVersion = 2;


   DatabaseProvider._init();
  static final DatabaseProvider instance = DatabaseProvider._init();

  Database? _database;

  Future<Database> get database async{
    if(_database == null){
      _database = await _initDatabase();
    }
    return _database!;
  }

  Future<Database> _initDatabase() async{
    String databasePath = await getDatabasesPath();
    String dbPath = '$databasePath/$_dbName';
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,

    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
      '''
      CREATE TABLE ${cadastro.nome_tabela} (
      ${cadastro.campo_id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${cadastro.Email} TEXT NOT NULL,
      ${cadastro.Senha} TEXT NOT NULL,
      ${cadastro.Nome} TEXT NOT NULL,
      ${cadastro.Cpf} TEXT NOT NULL,
      ${cadastro.Celular} TEXT,
      );
      '''
    );
  }
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{
    switch(oldVersion){
      case 1:
        await db.execute('''
        ALTER TABLE ${cadastro.nome_tabela}
        ADD ${cadastro.Senha} TEXT NOT NULL
        ''');
    }
  }
  
}