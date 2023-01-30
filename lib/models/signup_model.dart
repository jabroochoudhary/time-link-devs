class SignUpModel {
  String? firstname;
  String? lastname;
  String? email;
  String? pass;
  String? personalphonenumber;
  String? phonenumber;
  String? address;
  int? age;
  String? id;
  String? image;

  SignUpModel(
      {this.firstname,
      this.lastname,
      this.email,
      this.pass,
      this.personalphonenumber,
      this.phonenumber,
      this.address,
      this.id,
      this.image,
      this.age});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    pass = json['pass'];
    personalphonenumber = json['personalphonenumber'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    age = json['age'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['image'] = this.image;
    data['personalphonenumber'] = this.personalphonenumber;
    data['phonenumber'] = this.phonenumber;
    data['address'] = this.address;
    data['age'] = this.age;
    return data;
  }
}
