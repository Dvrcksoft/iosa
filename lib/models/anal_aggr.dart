import 'package:json_annotation/json_annotation.dart';

import '_parsers.dart';

part 'anal_aggr.g.dart';

@JsonSerializable(explicitToJson: true)
class AnalAggr {
  @JsonKey(defaultValue: '', name: 'id')
  String id;
  @JsonKey(defaultValue: [], name: 'data')
  List<Anal> data;

  AnalAggr()
      : id = '',
        data = [];

  factory AnalAggr.fromJson(Map<String, dynamic> json) => _$AnalAggrFromJson(json);
  Map<String, dynamic> toJson() => _$AnalAggrToJson(this)..remove('id');
}

@JsonSerializable(explicitToJson: true)
class Anal {
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
  DateTime? analDate;
  @JsonKey(fromJson: parseToDateTime, toJson: parseToDateTime)
  DateTime? timestampCreated;

  Anal()
      : id = '',
        image = '',
        title = '',
        body = '',
        isFeatured = false,
        isPremium = false,
        analDate = null,
        timestampCreated = null;

  factory Anal.fromJson(Map<String, dynamic> json) => _$AnalFromJson(json);
  Map<String, dynamic> toJson() => _$AnalToJson(this)
    ..remove('id')
    ..remove('timestampCreated');
}
