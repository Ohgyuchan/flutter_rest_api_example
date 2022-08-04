class PictureModel {
  String id;
  String author;

  PictureModel({required this.id, required this.author});

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
        id: json['char_id'],
        author: json['author'],
      );
}
