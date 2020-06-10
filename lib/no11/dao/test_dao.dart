import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imoocflutterdemo/no11/model/test_model.dart';

const USDT_CNY_URL = 'http://h5.test-kdax.com/exchangeApi/common/usdtcny';

class TestDao {
  static Future<TestModel> fetch() async {
    final response = await http.get(USDT_CNY_URL);
    if (response.statusCode == 200) {
      Utf8Decoder _utf8decoder = Utf8Decoder(); //参数返回有中文乱码
      var result = json.decode(_utf8decoder.convert(response.bodyBytes));
      return TestModel.fromJson(result);
    } else {
      throw Exception('请求接口失败');
    }
  }
}
