part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  Future<UserModel> register(String nip, String name, String password) async {
    try {
      var body = {
        'nip': nip,
        'name': name,
        'password': password,
      };
      var response =
          await http.post(Uri.parse(apiurl + 'addUsers'), body: body);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> login(String nip, String password) async {
    try {
      var body = {
        'nip': nip,
        'password': password,
      };
      var response = await http.post(Uri.parse(apiurl + 'login'), body: body);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var response1 = jsonDecode(response.body);
        print(response1['values']['success']);
        if (response1['values']['success'] == 'true') {
          return UserModel.fromJson(response1['values']['user']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<UserModel> getUsers(token, UserProvider postNotifier) async {
    bool result = false;
    var response = await http.get(Uri.parse(apiurl + 'getUser/' + '$token'));
    if (response.statusCode == 200) {
      result = true;
      if (jsonDecode(response.body) != '') {
        print('success get data user');
        print('${response.body}');
        Map json = jsonDecode(response.body);
        Map values = json['values'];
        String success = values['success'];
        if (success == 'true') {
          Map data = values['data'];
          print('$data');
          UserModel user = UserModel.fromJson(data);
          print('${user.name}');
          print('success get data user');
          postNotifier.setUser(user);
        }
      } else {
        print('Request failed');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      result = false;
    }

    return UserModel();
  }
}
