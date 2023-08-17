import 'package:json_annotation/json_annotation.dart';

import '_parsers.dart';

part 'srat_aggr.g.dart';

@JsonSerializable(explicitToJson: true)
class SratAggr {
  @JsonKey(defaultValue: '', name: 'id')
  String id;
  @JsonKey(defaultValue: [], name: 'data')
  List<Srat> data;

  SratAggr()
      : id = '',
        data = [];

  factory SratAggr.fromJson(Map<String, dynamic> json) => _$SratAggrFromJson(json);
  Map<String, dynamic> toJson() => _$SratAggrToJson(this)..remove('id');
}

@JsonSerializable(explicitToJson: true)
class Srat {
  @JsonKey(defaultValue: '')
  String id;
  @JsonKey(defaultValue: '')
  String image;
  @JsonKey(defaultValue: '')
  String title;
  @JsonKey(defaultValue: '')
  String body;
  @JsonKey(defaultValue: false)
  bool isFeatured;
  @JsonKey(defaultValue: false)
  bool isPremium;
  @JsonKey(fromJson: parseToDateTime, toJson: parseToDateTime)
  DateTime? sratDate;
  @JsonKey(fromJson: parseToDateTime, toJson: parseToDateTime)
  DateTime? timestampCreated;

  Srat()
      : id = '',
        image = '',
        title = '',
        body = '',
        isFeatured = false,
        isPremium = false,
        sratDate = null,
        timestampCreated = null;

  factory Srat.fromJson(Map<String, dynamic> json) => _$SratFromJson(json);
  Map<String, dynamic> toJson() => _$SratToJson(this)
    ..remove('id')
    ..remove('timestampCreated');
}
