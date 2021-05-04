part of 'providers.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  setUser(UserModel user) {
    print('${user.name}');
    _user = user;
    notifyListeners();
  }

  Future<UserModel> getUserService(token) async {
    return await AuthProvider.getUsers(token, this);
  }
}
