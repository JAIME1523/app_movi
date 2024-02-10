import 'package:app_movie/infrastructure/models/movie_detail_model.dart';
import 'package:app_movie/infrastructure/models/movie_model.dart';
import 'package:app_movie/infrastructure/models/schemas/movi_shema_model.dart';
import 'package:app_movie/infrastructure/models/schemas/user_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsraDatasource {
  late Future<Isar> db;
  IsraDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        ResultMovieSchema,
        MovieDetailModelSchema,
        MoviShemaModelSchema,
        UserModelSchema,
      ], inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Future saveMovie(List<ResultMovie> movie, MoviShemaModel pages) async {
    final isar = await db;
    MoviShemaModel page = MoviShemaModel(page: 1);

    final pages = await isar.writeTxn(() async {
      await isar.moviShemaModels.where().findFirst();
    });
    if (pages != null) {
      page.page = pages.page;
    }
    await isar.writeTxn(() async => isar.resultMovies.putAll(movie));
    await isar.writeTxn(() async => isar.moviShemaModels.put(page));
  }

  Future deleteData() async {
    final isar = await db;
    await isar.writeTxn(() async {
      final allRecipes = await isar.resultMovies.where().findAll();
      await isar.resultMovies.deleteAll([...allRecipes.map((e) => e.idIra)]);
    });
  }

  Future<List<ResultMovie>> searchData() async {
    List<ResultMovie> allRecipes = [];
    final isar = await db;
    await isar.writeTxn(() async {
      allRecipes = await isar.resultMovies.where().findAll();
    });
    return allRecipes;
  }

  Future<int> getPage() async {
    List<MoviShemaModel> allRecipes = [];
    final isar = await db;
    await isar.writeTxn(() async {
      allRecipes = await isar.moviShemaModels.where().findAll();
    });
    return allRecipes.isEmpty ? 1 : allRecipes[0].page ?? 1;
  }

  Future<UserModel?> createUser() async {
    final isar = await db;

    UserModel? user;
    await isar.writeTxn(() async {
      dynamic type = await isar.userModels.where().findFirst();
      if (type != null) {
        user = type;
      }
    });
    if (user == null) {
      await isar.writeTxn(() async =>
          isar.userModels.put(UserModel(imaUrl: '', name: 'User 1')));
      await isar.writeTxn(() async {
        user = (await isar.userModels.where().findFirst());
      });
    }
    return user;
  }

  Future updateUser(UserModel user) async {
    final isar = await db;

    await isar.writeTxn(() async => isar.userModels.put(user));
  }

  Future createDetail(MovieDetailModel movieDetail) async {
    final isar = await db;

    await isar.writeTxn(() async => isar.movieDetailModels.put(movieDetail));
    await getDetails();
  }

  Future<List<MovieDetailModel>> getDetails() async {
    final isar = await db;
    List<MovieDetailModel> listInfo = [];
    listInfo = await isar
        .writeTxn(() async => isar.movieDetailModels.where().findAll());

    return listInfo;
  }

  Future<List<MovieDetailModel>> deleteDetail(
      MovieDetailModel movieDetail) async {
    final isar = await db;
    await isar
        .writeTxn(() async => isar.movieDetailModels.delete(movieDetail.id));
    return await getDetails();
  }
}
