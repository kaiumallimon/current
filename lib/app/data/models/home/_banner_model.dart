class BannerModel {
  final String image;
  final String title;
  final String subtitle;
  final String tag;

  BannerModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.tag,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      tag: json['tag'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'tag': tag,
    };
  }
}
