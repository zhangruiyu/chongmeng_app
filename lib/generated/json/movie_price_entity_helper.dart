import 'package:chongmeng/function/movie/movie_cinema/model/movie_price_entity.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

moviePriceEntityFromJson(MoviePriceEntity data, Map<String, dynamic> json) {
  data.status = json['status']?.toInt();
  data.msg = json['msg']?.toString();
  data.data =
      json['data'] != null ? new MoviePriceData().fromJson(json['data']) : null;
  return data;
}

Map<String, dynamic> moviePriceEntityToJson(MoviePriceEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['status'] = entity.status;
  data['msg'] = entity.msg;
  if (entity.data != null) {
    data['data'] = MoviePriceData().toJson();
  }
  return data;
}

moviePriceDataFromJson(MoviePriceData data, Map<String, dynamic> json) {
  data.itemMoney = json['itemMoney']?.toInt();
  return data;
}

Map<String, dynamic> moviePriceDataToJson(MoviePriceData entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['itemMoney'] = entity.itemMoney;
  return data;
}
