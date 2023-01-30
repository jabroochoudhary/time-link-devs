class LogInModel {
  String? email;
  String? pass;
  LogInModel({
    this.email,
    this.pass,
  });

  LogInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['pass'] = this.pass;

    return data;
  }
}
