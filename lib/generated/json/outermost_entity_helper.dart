import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

outermostEntityFromJson(OutermostEntity data, Map<String, dynamic> json) {
	data.status = json['status']?.toInt();
	return data;
}

Map<String, dynamic> outermostEntityToJson(OutermostEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	return data;
}