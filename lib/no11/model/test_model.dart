class TestModel {
  String code;
  Data data;
  String msg;

  TestModel({this.code, this.data, this.msg});

  TestModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  double uSDT;

  Data({this.uSDT});

  Data.fromJson(Map<String, dynamic> json) {
    uSDT = json['USDT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USDT'] = this.uSDT;
    return data;
  }
}
