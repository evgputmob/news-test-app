// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['Id'] as int,
      title: json['Title'] as String,
      text: json['Text'] as String,
      dateTime: json['DateTime'] as String,
      previewPath: json['PreviewPath'] as String?,
      mainImagePath: json['MainImagePath'] as String?,
      additionalImagesPaths: (json['AdditionalImagesPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      language: json['Language'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Text': instance.text,
      'DateTime': instance.dateTime,
      'PreviewPath': instance.previewPath,
      'MainImagePath': instance.mainImagePath,
      'AdditionalImagesPaths': instance.additionalImagesPaths,
      'Language': instance.language,
    };
