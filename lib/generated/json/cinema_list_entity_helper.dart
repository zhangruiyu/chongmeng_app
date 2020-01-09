import 'package:chongmeng/function/movie/cinema_list/model/cinema_list_entity.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

cinemaListEntityFromJson(CinemaListEntity data, Map<String, dynamic> json) {
  if (json['cinemas'] != null) {
    data.cinemas = new List<CinemaListCinema>();
    (json['cinemas'] as List).forEach((v) {
      data.cinemas.add(new CinemaListCinema().fromJson(v));
    });
  }
  if (json['ct_pois'] != null) {
    data.ctPois = new List<CinemaListCtPoi>();
    (json['ct_pois'] as List).forEach((v) {
      data.ctPois.add(new CinemaListCtPoi().fromJson(v));
    });
  }
  data.paging = json['paging'] != null
      ? new CinemaListPaging().fromJson(json['paging'])
      : null;
  data.resId = json['resId']?.toString();
  return data;
}

Map<String, dynamic> cinemaListEntityToJson(CinemaListEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (entity.cinemas != null) {
    data['cinemas'] = entity.cinemas.map((v) => v.toJson()).toList();
  }
  if (entity.ctPois != null) {
    data['ct_pois'] = entity.ctPois.map((v) => v.toJson()).toList();
  }
  if (entity.paging != null) {
    data['paging'] = CinemaListPaging().toJson();
  }
  data['resId'] = entity.resId;
  return data;
}

cinemaListCinemaFromJson(CinemaListCinema data, Map<String, dynamic> json) {
  data.id = json['id']?.toInt();
  data.mark = json['mark']?.toInt();
  data.nm = json['nm']?.toString();
  data.sellPrice = json['sellPrice']?.toString();
  data.addr = json['addr']?.toString();
  data.distance = json['distance']?.toString();
  data.tag = json['tag'] != null
      ? new CinemaListCinemasTag().fromJson(json['tag'])
      : null;
  data.promotion = json['promotion'] != null
      ? new CinemaListCinemasPromotion().fromJson(json['promotion'])
      : null;
  data.showTimes = json['showTimes']?.toString();
  return data;
}

Map<String, dynamic> cinemaListCinemaToJson(CinemaListCinema entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['mark'] = entity.mark;
  data['nm'] = entity.nm;
  data['sellPrice'] = entity.sellPrice;
  data['addr'] = entity.addr;
  data['distance'] = entity.distance;
  if (entity.tag != null) {
    data['tag'] = CinemaListCinemasTag().toJson();
  }
  if (entity.promotion != null) {
    data['promotion'] = CinemaListCinemasPromotion().toJson();
  }
  data['showTimes'] = entity.showTimes;
  return data;
}

cinemaListCinemasTagFromJson(
    CinemaListCinemasTag data, Map<String, dynamic> json) {
  data.allowRefund = json['allowRefund']?.toInt();
  data.buyout = json['buyout']?.toInt();
  data.cityCardTag = json['cityCardTag']?.toInt();
  data.deal = json['deal']?.toInt();
  data.endorse = json['endorse']?.toInt();
  data.giftTag = json['giftTag']?.toString();
  if (json['hallType'] != null) {
    data.hallType =
        json['hallType']?.map((v) => v?.toString())?.toList()?.cast<String>();
  }
  if (json['hallTypeVOList'] != null) {
    data.hallTypeVOList = new List<CinemaListCinemasTagHallTypeVOList>();
    (json['hallTypeVOList'] as List).forEach((v) {
      data.hallTypeVOList
          .add(new CinemaListCinemasTagHallTypeVOList().fromJson(v));
    });
  }
  data.sell = json['sell']?.toInt();
  data.snack = json['snack']?.toInt();
  data.vipTag = json['vipTag']?.toString();
  return data;
}

Map<String, dynamic> cinemaListCinemasTagToJson(CinemaListCinemasTag entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['allowRefund'] = entity.allowRefund;
  data['buyout'] = entity.buyout;
  data['cityCardTag'] = entity.cityCardTag;
  data['deal'] = entity.deal;
  data['endorse'] = entity.endorse;
  data['giftTag'] = entity.giftTag;
  data['hallType'] = entity.hallType;
  if (entity.hallTypeVOList != null) {
    data['hallTypeVOList'] =
        entity.hallTypeVOList.map((v) => v.toJson()).toList();
  }
  data['sell'] = entity.sell;
  data['snack'] = entity.snack;
  data['vipTag'] = entity.vipTag;
  return data;
}

cinemaListCinemasTagHallTypeVOListFromJson(
    CinemaListCinemasTagHallTypeVOList data, Map<String, dynamic> json) {
  data.name = json['name']?.toString();
  data.url = json['url']?.toString();
  return data;
}

Map<String, dynamic> cinemaListCinemasTagHallTypeVOListToJson(
    CinemaListCinemasTagHallTypeVOList entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

cinemaListCinemasPromotionFromJson(
    CinemaListCinemasPromotion data, Map<String, dynamic> json) {
  data.cardPromotionTag = json['cardPromotionTag']?.toString();
  data.couponPromotionTag = json['couponPromotionTag']?.toString();
  data.merchantActivityTag = json['merchantActivityTag']?.toString();
  data.packShowActivityTag = json['packShowActivityTag']?.toString();
  data.platformActivityTag = json['platformActivityTag']?.toString();
  data.starActivityTag = json['starActivityTag']?.toString();
  return data;
}

Map<String, dynamic> cinemaListCinemasPromotionToJson(
    CinemaListCinemasPromotion entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['cardPromotionTag'] = entity.cardPromotionTag;
  data['couponPromotionTag'] = entity.couponPromotionTag;
  data['merchantActivityTag'] = entity.merchantActivityTag;
  data['packShowActivityTag'] = entity.packShowActivityTag;
  data['platformActivityTag'] = entity.platformActivityTag;
  data['starActivityTag'] = entity.starActivityTag;
  return data;
}

cinemaListCtPoiFromJson(CinemaListCtPoi data, Map<String, dynamic> json) {
  data.ctPoi = json['ct_poi']?.toString();
  data.poiid = json['poiid']?.toInt();
  return data;
}

Map<String, dynamic> cinemaListCtPoiToJson(CinemaListCtPoi entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['ct_poi'] = entity.ctPoi;
  data['poiid'] = entity.poiid;
  return data;
}

cinemaListPagingFromJson(CinemaListPaging data, Map<String, dynamic> json) {
  data.hasMore = json['hasMore'];
  data.limit = json['limit']?.toInt();
  data.offset = json['offset']?.toInt();
  data.total = json['total']?.toInt();
  return data;
}

Map<String, dynamic> cinemaListPagingToJson(CinemaListPaging entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['hasMore'] = entity.hasMore;
  data['limit'] = entity.limit;
  data['offset'] = entity.offset;
  data['total'] = entity.total;
  return data;
}
