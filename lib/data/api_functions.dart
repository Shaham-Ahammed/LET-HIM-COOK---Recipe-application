import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/utils/valuenotifiers.dart';


class ApiFunctions{
 static Future<List<dynamic>> fetchingCategories() async {
  final url = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final list = json['categories'];

      return list;
    }
  } catch (e) {
    print("error occured $e");
  }
  return [];
}


static Future<Map<String, dynamic>> fetchItemById(String id) async {
  final url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final item = json['meals'][0];
      return item;
    }
  } catch (e) {
    print("error occured $e");
  }
  return {};
}

static Future<Map<String, dynamic>> fetchItemRandomly() async {
  final url = "https://www.themealdb.com/api/json/v1/1/random.php";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final item = json['meals'][0];

      final allData = await DbHelper.getAllData();
      List<String> ids = [];
      for (var ele in allData) {
        ids.add(ele['id']);
      }
      if (ids.contains(item['idMeal'])) {
        isFavorite.value = true;
      } else {
        isFavorite.value = false;
      }

      return item;
    }
  } catch (e) {
    print("error occured $e");
  }

  return {};
}
static Future<List<dynamic>> fetchingIndividualCategoryItems(String category) async {
  final url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final list = json['meals'];
      return list;
    }
  } catch (e) {
    print("exception caught $e");
    return [];
  }
  return [];
}

static Future<List<dynamic>> fetchingAccordingToName(String name) async {
  final url = "https://www.themealdb.com/api/json/v1/1/search.php?s=$name";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final list = json['meals'];
      return list;
    }
  } catch (e) {
    print("exception caught $e");
    return [];
  }
  return [];
}


}