import 'dart:convert';
import 'dart:io';

class LoadJson {
  LoadJson._();

  static Future<List<Map>> readJsonFile(String filePath) async {
    var input = await File(filePath).readAsString();
    var map = jsonDecode(input);
    return map;
  }
}
