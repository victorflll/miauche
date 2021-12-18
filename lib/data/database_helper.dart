import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db!;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'miauche.db');
    debugPrint(path);

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE `USER`(`name` varchar(200) NOT NULL, `phone` varchar(200) NOT NULL, `email` varchar(200) PRIMARY KEY, `password` varchar(45) NOT NULL, `cep` varchar(200) NULL, `city` varchar(200) NOT NULL, `neighborhood` varchar(200) NOT NULL, `street` varchar(200) NULL, `house_number` INTEGER NULL, `complement` varchar(200) NULL);";
    await db.execute(sql);

    sql =
        "CREATE TABLE `FIND_ANIMAL`(`id_find` INTEGER PRIMARY KEY, `age` INTEGER  NULL, `has_collor` boolean NOT NULL, `has_deficiency` boolean NOT NULL, `deficiency` varchar(200) NULL, `animal_type` varchar(30) NOT NULL, `gender` varchar(30) NOT NULL, `breed` varchar(30) NOT NULL, `size` varchar(30) NOT NULL, `fur` varchar(30) NOT NULL, `fur_collor` varchar(30) NOT NULL, `additional_features` varchar(500) NULL, `cep` varchar(200) NULL, `city` varchar(200) NOT NULL, `neighborhood` varchar(200) NOT NULL, `street` varchar(200) NULL, `house_number` INTEGER NULL, `complement` varchar(200) NULL, `news_name_find` varchar(200) NULL, `description` varchar(200) NULL, `phone_contact` varchar(200) NOT NULL, `image_path` varchar(200) NULL);";
    await db.execute(sql);

    sql =
        "CREATE TABLE `LOST_ANIMAL`(`id_lost` INTEGER PRIMARY KEY, `animal_name` varchar(30) NULL, `age` INTEGER  NULL, `has_collor` boolean NOT NULL, `has_deficiency` boolean NOT NULL, `deficiency` varchar(200) NULL, `animal_type` varchar(30) NOT NULL, `gender` varchar(30) NOT NULL, `breed` varchar(30) NOT NULL, `size` varchar(30) NOT NULL, `fur` varchar(30) NOT NULL, `fur_collor` varchar(30) NOT NULL, `additional_features` varchar(500) NULL, `cep` varchar(200) NULL, `city` varchar(200) NOT NULL, `neighborhood` varchar(200) NOT NULL, `street` varchar(200) NULL, `house_number` INTEGER NULL, `complement` varchar(200) NULL, `news_name_lost` varchar(200) NULL, `description` varchar(200) NULL, `phone_contact` varchar(200) NOT NULL, `reward` varchar(200) NULL, `image_path` varchar(200) NULL);";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Carlos Augusto', '82991065093', 'camnj1@aluno.ifal.edu.br', 'senha123456', '57300000', 'Arapiraca', 'Caititus', 'Andre Felix', 95, 'Casa');";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Wildimyla Leite', '82999773417', 'wkdol1@aluno.ifal.edu.br', 'senha123456', '57300000', 'Arapiraca', 'Baixa Grande', 'Fábio Tavares', 07, 'Casa');";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Victor Lemos', '8299999-9999', 'vlll1@aluno.ifal.edu.br', 'senha123456', '573000000', 'Arapiraca', 'Baixão', 'Ângelo Tadeu', 97, 'Casa');";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Guilherme Barbosa', '8299999-9999', 'gbp1@aluno.ifal.edu.br', 'senha123456', '573000000', 'Arapiraca', 'Novo Horizonte', 'Avenida Minervina', 974, 'Casa');";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Monalisa Cavalcante', '8299999-9999', 'msc5@aluno.ifal.edu.br', 'senha123456', '573000000', 'Arapiraca', 'Centro', '15 de Novembro', 875, 'Casa');";
    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Ana Beatriz', '8299999-9999', 'absm1@aluno.ifal.edu.br', 'senha123456', '573000000', 'Arapiraca', 'Canafistula', 'Rua Afonso Pena', 648, 'Casa');";

    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Tarsis Marinho', '8299999-9999', 'tarsis.souza@ifal.edu.br', 'senha123456', '573000000', 'Arapiraca', 'Centro', 'Rua São Francisco', 924, 'Casa');";

    await db.execute(sql);

    sql =
        "INSERT INTO `USER`(`name`, `phone`, `email`, `password`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`) VALUES('Visitante', '4002-8922', 'visitante@ifal.edu.br', 'senha123456', '57300-310', 'Arapiraca', 'Centro', 'Rua Estudante José de Oliveira Leite', 00, 'Avenidade');";

    await db.execute(sql);

    sql =
        "INSERT INTO `FIND_ANIMAL`(`age`, `has_collor`, `has_deficiency`, `deficiency`, `animal_type`, `gender`, `breed`, `size`, `fur`, `fur_collor`,`additional_features`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`, `news_name_find`, `description`, `phone_contact`, `image_path`) VALUES (1, 0, 0, '', 'Gato', 'Macho', 'Pintado', 'Pequeno', 'Pelagem curta', 'pintado(preto e branco)', '', '57300000', 'Arapiraca','Novo Horizonte', 'Avenida Minervina', 79, 'Casa', 'Gato pintado sem coleira pelo bairro Novo Horizonte', 'Gato meio arisco encontrado em minha casa', '(82) 98181-9999', 'https://2.bp.blogspot.com/-3TFNt2X_HxM/V0DjAxymUMI/AAAAAAAAJnw/R6fs7naJLzAyh2rpQoJCm6eaLQo9pSuGgCLcB/s1600/gato-mascarado-preto-e-branco-black-white-cat.jpg');";
    await db.execute(sql);

    sql =
        "INSERT INTO `LOST_ANIMAL`(`animal_name`, `age`, `has_collor`, `has_deficiency`, `deficiency`, `animal_type`, `gender`, `breed`, `size`, `fur`, `fur_collor`, `additional_features`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`, `news_name_lost`, `description`, `phone_contact`, `reward`, `image_path`) VALUES('Nico', 2, 1, 0, '', 'Gato', 'Macho', 'Siamês', 'Pequeno', 'Pelagem curta', 'Preta', '','57300000', 'Arapiraca', 'Alto do Cruzeiro', 'Rua Presidente Medici', 158, 'Casa', 'Gato sumido há 6 dias na região do alto do Cruzeiro', 'Animal dócil e pode ser identificado por ter problema de locomoção na sua patinha traseira direita', '(82) 99999-8888', '', 'https://saude.abril.com.br/wp-content/uploads/2021/03/bichos-foto-vauvau-Getty-Images.png?quality=85&strip=info&resize=680,453');";
    await db.execute(sql);

    sql =
        "INSERT INTO `LOST_ANIMAL`(`animal_name`, `age`, `has_collor`, `has_deficiency`, `deficiency`, `animal_type`, `gender`, `breed`, `size`, `fur`, `fur_collor`, `additional_features`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`, `news_name_lost`, `description`, `phone_contact`, `reward`, `image_path`) VALUES ('Alexia', 6, 1, 0, '', 'Cachorro', 'Femea', 'Caramelo', 'Grande', 'Pelagem média', 'Marrom', '', '57300000', 'Arapiraca', 'Novo Horizonte', 'Rua Andre Felix da Silva', 495, 'Casa', 'Cachorro fugiu durante passeio na area verde', 'Cadela grande, dócil e atende por Alexia, qualquer informacao, por favor, entrar em contato', '(82) 99785-6666', '', 'https://www.portalmamore.com.br/wp-content/uploads/2018/08/38747202_1489866814492901_3388966575091482624_n.jpg');";

    await db.execute(sql);

    sql =
        "INSERT INTO `FIND_ANIMAL`(`age`, `has_collor`, `has_deficiency`, `deficiency`, `animal_type`, `gender`, `breed`, `size`, `fur`, `fur_collor`,`additional_features`, `cep`, `city`, `neighborhood`, `street`, `house_number`, `complement`, `news_name_find`, `description`, `phone_contact`, `image_path`) VALUES (5, 1, 0, '', 'Cachorro', 'Macho', 'Viralata', 'Grande', 'Pelagem curta', 'Preto', 'Vermelha', '57300000', 'Arapiraca', 'Brasilia', 'Rua Brasilia', 155, 'Casa', 'Cachorro encontrado no bairro brasilia', 'Animal dócil e aparentemente saudável', '(82) 98588-7777', 'https://www.dicaspetz.com.br/wp-content/uploads/2020/06/gatos-pretos.jpg');";

    await db.execute(sql);
  }
}
