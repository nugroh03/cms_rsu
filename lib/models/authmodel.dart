class AuthModel {
  final String token;
  AuthModel(this.token);
  Map toJson() => {'token': token};

  AuthModel.fromJson(Map data) : token = data['token'];
}
