import 'dart:convert';

import 'package:isar/isar.dart';
part 'movi_shema_model.g.dart';
@collection
class MoviShemaModel {
  Id idIra = Isar.autoIncrement;
  late  int page;


  MoviShemaModel({
    required this.page,

  });

  factory MoviShemaModel.fromJson(String str) =>
      MoviShemaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MoviShemaModel.fromMap(Map<String, dynamic> json) => MoviShemaModel(
        page: json["page"],
        
      
      );

  Map<String, dynamic> toMap() => {
        "page": page,

      };
}

