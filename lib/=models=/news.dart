import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Text')
  final String text;
  @JsonKey(name: 'DateTime')
  final String dateTime;
  @JsonKey(name: 'PreviewPath')
  final String? previewPath;
  @JsonKey(name: 'MainImagePath')
  final String? mainImagePath;
  @JsonKey(name: 'AdditionalImagesPaths')
  final List<String> additionalImagesPaths;
  @JsonKey(name: 'Language')
  final String language;

  News({
    required this.id,
    required this.title,
    required this.text,
    required this.dateTime,
    required this.previewPath,
    required this.mainImagePath,
    required this.additionalImagesPaths,
    required this.language,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
