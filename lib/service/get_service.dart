// class list data uri response if var return
import 'package:http/http.dart' as http;
import 'package:flutter_get_api/modals/user_modals.dart';

class GetService {
  Future<List<UserModals>?> getUsers() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await data.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userModalsFromJson(json);
    }
    return null;
  }
}
