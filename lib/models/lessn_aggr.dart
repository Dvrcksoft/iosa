import 'package:json_annotation/json_annotation.dart';

import '_parsers.dart';

part 'lessn_aggr.g.dart';

@JsonSerializable(explicitToJson: true)
class LessnAggr {
  @JsonKey(defaultValue: '', name: 'id')
  String id;
  @JsonKey(defaultValue: [], name: 'data')
  List<Lessn> data;

  LessnAggr()
      : id = '',
        data = [];

  factory LessnAggr.fromJson(Map<String, dynamic> json) => _$LessnAggrFromJson(json);
  Map<String, dynamic> toJson() => _$LessnAggrToJson(this)..remove('id');
}

@JsonSerializable(explicitToJson: true)
class Lessn {
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
  DateTime? lessnDate;
  @JsonKey(fromJson: parseToDateTime, toJson: parseToDateTime)
  DateTime? timestampCreated;

  Lessn()
      : id = '',
        image = '',
        title = '',
        body = '',
        isFeatured = false,
        isPremium = false,
        lessnDate = null,
        timestampCreated = null;

  factory Lessn.fromJson(Map<String, dynamic> json) => _$LessnFromJson(json);
  Map<String, dynamic> toJson() => _$LessnToJson(this)
    ..remove('id')
    ..remove('timestampCreated');
}
