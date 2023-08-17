// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anal_aggr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalAggr _$AnalAggrFromJson(Map<String, dynamic> json) => AnalAggr()
  ..id = json['id'] as String? ?? ''
  ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Anal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$AnalAggrToJson(AnalAggr instance) => <String, dynamic>{
      'id': instance.id,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Anal _$AnalFromJson(Map<String, dynamic> json) => Anal()
  ..id = json['id'] as String? ?? ''
  ..image = json['image'] as String? ?? ''
  ..title = json['title'] as String? ?? ''
  ..body = json['body'] as String? ?? ''
  ..isFeatured = json['isFeatured'] as bool? ?? false
  ..isPremium = json['isPremium'] as bool? ?? false
  ..analDate = parseToDateTime(json['analDate'])
  ..timestampCreated = parseToDateTime(json['timestampCreated']);

Map<String, dynamic> _$AnalToJson(Anal instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'body': instance.body,
      'isFeatured': instance.isFeatured,
      'isPremium': instance.isPremium,
      'analDate': parseToDateTime(instance.analDate),
      'timestampCreated': parseToDateTime(instance.timestampCreated),
    };
