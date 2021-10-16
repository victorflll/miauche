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
        'CREATE TABLE `USER`(`id_user` int NOT NULL auto_increment, `name` varchar(200) NOT NULL default '
        ', `phone` varchar(200) NOT NULL default '
        ', `email` varchar(200) NOT NULL default '
        ' unique, `password` varchar(45) NOT NULL default '
        ', `cep` varchar(200) NULL default '
        ', `city` varchar(200) NOT NULL default '
        ', `neighborhood` varchar(200) NOT NULL default '
        ', `street` varchar(200) NULL default '
        ', `house_number` varchar(200) NULL default '
        ', `complement` varchar(200) NULL default '
        ', PRIMARY KEY(`id_user`, `email`)); ';
    await db.execute(sql);

    sql =
        'CREATE TABLE `FIND_ANIMAL`( `id_find` int NOT NULL auto_increment, `animal_name` varchar(30) NULL default'
        ', `age` int NULL, `has_collor` boolean NOT NULL, `has_deficiency` boolean NOT NULL, `deficiency` varchar(200) NULL, `animal_type` varchar(30) NOT NULL default '
        ', `gender` varchar(30) NOT NULL default '
        ', `size` varchar(30) NOT NULL default '
        ', `fur` varchar(30) NOT NULL default'
        ', `fur_collor` varchar(30) NOT NULL default'
        ', `additional_features` varchar(500) NULL default '
        ', `cep` varchar(200) NULL default '
        ', `city` varchar(200) NOT NULL default '
        ', `neighborhood` varchar(200) NOT NULL default '
        ', `street` varchar(200) NULL default '
        ', `house_number` varchar(200) NULL default '
        ', `complement` varchar(200) NULL default '
        ', `news_name_find` varchar(200) NULL default'
        ', `description` varchar(200) NULL default '
        ', `imagePath` varchar(200) NULL default '
        ', PRIMARY KEY(`id_find`, `news_name_find`);';
    await db.execute(sql);

    sql =
        'CREATE TABLE `LOST_ANIMAL`(`id_lost` int NOT NULL auto_increment, `animal_name` varchar(30) NULL default'
        ', `age` int NULL, `has_collor` boolean NOT NULL, `has_deficiency` boolean NOT NULL, `deficiency` varchar(200) NULL, `animal_type` varchar(30) NOT NULL default '
        ', `gender` varchar(30) NOT NULL default '
        ', `size` varchar(30) NOT NULL default '
        ', `fur` varchar(30) NOT NULL default'
        ', `fur_collor` varchar(30) NOT NULL default'
        ', `additional_features` varchar(500) NULL default '
        ', `cep` varchar(200) NULL default '
        ', `city` varchar(200) NOT NULL default '
        ', `neighborhood` varchar(200) NOT NULL default '
        ', `street` varchar(200) NULL default '
        ', `house_number` varchar(200) NULL default '
        ', `complement` varchar(200) NULL default '
        ', `news_name_lost` varchar(200) NULL default'
        ', `description` varchar(200) NULL default '
        ', `reward` varchar(200) NULL default '
        ', `imagePath` varchar(200) NULL default '
        ', PRIMARY KEY(`id_lost`, `news_name_lost`);';
    await db.execute(sql);
  }
}
