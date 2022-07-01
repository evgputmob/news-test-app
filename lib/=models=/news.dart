class News {
  final int id;
  final String title;
  final String text;
  final String dateTime;
  final String? previewPath;
  final String? mainImagePath;
  final List<String> additionalImagesPaths;
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

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['Id'],
        title: json['Title'],
        text: json['Text'],
        dateTime: json['DateTime'], //DateTime.parse(json['DateTime']),
        previewPath: json['PreviewPath'],
        mainImagePath: json['MainImagePath'],
        additionalImagesPaths:
            List<String>.from(json['AdditionalImagesPaths'].map((x) => x)),
        language: json['Language'],
      );
}
