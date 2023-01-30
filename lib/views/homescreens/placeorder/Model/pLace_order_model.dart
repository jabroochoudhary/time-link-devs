class PlaceOrderModel {
  String? id;
  String? title;
  String? userid;
  String? lastdate;
  int? budget;

  PlaceOrderModel(
      {this.id, this.title, this.userid, this.lastdate, this.budget});

  PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userid = json['userid'];
    lastdate = json['lastdate'];
    budget = json['budget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['userid'] = this.userid;
    data['lastdate'] = this.lastdate;
    data['budget'] = this.budget;
    return data;
  }
}
