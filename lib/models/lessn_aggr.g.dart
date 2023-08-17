// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessn_aggr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessnAggr _$LessnAggrFromJson(Map<String, dynamic> json) => LessnAggr()
  ..id = json['id'] as String? ?? ''
  ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Lessn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$LessnAggrToJson(LessnAggr instance) => <String, dynamic>{
      'id': instance.id,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Lessn _$LessnFromJson(Map<String, dynamic> json) => Lessn()
  ..id = json['id'] as String? ?? ''
  ..image = json['image'] as String? ?? ''
  ..title = json['title'] as String? ?? ''
  ..body = json['body'] as String? ?? ''
  ..isFeatured = json['isFeatured'] as bool? ?? false
  ..isPremium = json['isPremium'] as bool? ?? false
  ..lessnDate = parseToDateTime(json['lessnDate'])
  ..timestampCreated = parseToDateTime(json['timestampCreated']);

Map<String, dynamic> _$LessnToJson(Lessn instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'body': instance.body,
      'isFeatured': instance.isFeatured,
      'isPremium': instance.isPremium,
      'lessnDate': parseToDateTime(instance.lessnDate),
      'timestampCreated': parseToDateTime(instance.timestampCreated),
    };
