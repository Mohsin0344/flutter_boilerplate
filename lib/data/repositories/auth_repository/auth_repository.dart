import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/app_constants.dart';
import '../../response_models/user_model.dart';

abstract class AuthRepoInterface {
  Future<List<User>?> fetchUsers();
}

class AuthRepository implements AuthRepoInterface {
  @override
  Future<List<User>?> fetchUsers() async {
    Uri uri = Uri.parse(
      AppConstants.usersUrl,
    );

    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        List<User> users =
            (json.decode(response.body) as List).map((data) => User.fromJson(data)).toList();

        return users;
      } else if (response.statusCode == 500) {
        return null;
      } else {
        throw json.decode(response.body)['error']['message'];
      }
    } catch (e) {
      return null;
    }
  }
}
