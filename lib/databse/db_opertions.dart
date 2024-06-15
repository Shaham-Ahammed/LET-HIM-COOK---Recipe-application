import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/model/favorite_model.dart';

class DbOperations {
  addToFav(String id, String name, String imagePath) async {
    final FavModel model = FavModel(id: id, name: name, imagePath: imagePath);
    await DbHelper.createData(model);
  }

  removeFromFav(String id) async {
    await DbHelper.deleteData(id);
  }
  
}
