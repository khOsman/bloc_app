import 'dart:convert';

import 'package:bloc_app/models/user_model.dart';

import 'package:http/http.dart' as http;

class APIService {
 

  Future<List<UserModel>> getData() async {
    List<UserModel> userList = [];
    try {
      var request = http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userList.add(userModel);
        });
        return userList;
      } else
        return [];
    } catch (e) {
      throw e;
    }
  }
}
