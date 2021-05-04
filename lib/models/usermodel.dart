class UserModel {
  int id;
  String nip;
  String name;
  String password;
  String token;

  UserModel({
    this.id,
    this.nip,
    this.name,
    this.password,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nip = json['nip'];
    name = json['name'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nip': nip,
      'name': name,
      'password': password,
      'token': token,
    };
  }
}
