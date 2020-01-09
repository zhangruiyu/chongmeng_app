import 'package:chongmeng/function/movie/model/search_cinema_entity.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

searchCinemaEntityFromJson(SearchCinemaEntity data, Map<String, dynamic> json) {
  data.cinemas = json['cinemas'] != null
      ? new SearchCinemaCinemas().fromJson(json['cinemas'])
      : null;
  return data;
}

Map<String, dynamic> searchCinemaEntityToJson(SearchCinemaEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (entity.cinemas != null) {
    data['cinemas'] = SearchCinemaCinemas().toJson();
  }
  return data;
}

searchCinemaCinemasFromJson(
    SearchCinemaCinemas data, Map<String, dynamic> json) {
  if (json['list'] != null) {
    data.xList = new List<SearchCinemaCinemasList>();
    (json['list'] as List).forEach((v) {
      data.xList.add(new SearchCinemaCinemasList().fromJson(v));
    });
  }
  data.total = json['total']?.toInt();
  data.type = json['type']?.toInt();
  return data;
}

Map<String, dynamic> searchCinemaCinemasToJson(SearchCinemaCinemas entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (entity.xList != null) {
    data['list'] = entity.xList.map((v) => v.toJson()).toList();
  }
  data['total'] = entity.total;
  data['type'] = entity.type;
  return data;
}

searchCinemaCinemasListFromJson(
    SearchCinemaCinemasList data, Map<String, dynamic> json) {
  data.id = json['id']?.toInt();
  data.nm = json['nm']?.toString();
  data.sellPrice = json['sellPrice']?.toString();
  data.referencePrice = json['referencePrice']?.toString();
  data.addr = json['addr']?.toString();
  data.sell = json['sell'];
  data.deal = json['deal']?.toInt();
  if (json['hallType'] != null) {
    data.hallType =
        json['hallType']?.map((v) => v?.toString())?.toList()?.cast<String>();
  }
  data.allowRefund = json['allowRefund']?.toInt();
  data.endorse = json['endorse']?.toInt();
  data.snack = json['snack']?.toInt();
  data.vipDesc = json['vipDesc']?.toString();
  data.distance = json['distance']?.toString();
  return data;
}

Map<String, dynamic> searchCinemaCinemasListToJson(
    SearchCinemaCinemasList entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['nm'] = entity.nm;
  data['sellPrice'] = entity.sellPrice;
  data['referencePrice'] = entity.referencePrice;
  data['addr'] = entity.addr;
  data['sell'] = entity.sell;
  data['deal'] = entity.deal;
  data['hallType'] = entity.hallType;
  data['allowRefund'] = entity.allowRefund;
  data['endorse'] = entity.endorse;
  data['snack'] = entity.snack;
  data['vipDesc'] = entity.vipDesc;
  data['distance'] = entity.distance;
  return data;
}
