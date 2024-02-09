import 'package:isar/isar.dart';
 part 'user_model.g.dart';

@collection
class UserModel {
  Id idIra = Isar.autoIncrement;
  String? name;
  String? imaUrl;



  UserModel({
    this.name,
    this.imaUrl
  });
}
