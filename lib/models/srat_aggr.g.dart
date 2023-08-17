// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'srat_aggr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SratAggr _$SratAggrFromJson(Map<String, dynamic> json) => SratAggr()
  ..id = json['id'] as String? ?? ''
  ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => Srat.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$SratAggrToJson(SratAggr instance) => <String, dynamic>{
      'id': instance.id,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Srat _$SratFromJson(Map<String, dynamic> json) => Srat()
  ..id = json['id'] as String? ?? ''
  ..image = json['image'] as String? ?? ''
  ..title = json['title'] as String? ?? ''
  ..body = json['body'] as String? ?? ''
  ..isFeatured = json['isFeatured'] as bool? ?? false
  ..isPremium = json['isPremium'] as bool? ?? false
  ..sratDate = parseToDateTime(json['sratDate'])
  ..timestampCreated = parseToDateTime(json['timestampCreated']);

Map<String, dynamic> _$SratToJson(Srat instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'body': instance.body,
      'isFeatured': instance.isFeatured,
      'isPremium': instance.isPremium,
      'sratDate': parseToDateTime(instance.sratDate),
      'timestampCreated': parseToDateTime(instance.timestampCreated),
    };
