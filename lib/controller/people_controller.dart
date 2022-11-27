import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxtest/models/people.dart';
import 'package:http/http.dart' as http;

class PeopleController extends GetxController {
  var isLoading = false.obs;
  People? people;
  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        people = People.fromJson(result);
      } else {}
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
