class CategoryModel {
  final String title;
  final List<String>? subCategories;

  CategoryModel({
    required this.title,
    this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      subCategories: json['subCategories'] != null
          ? List<String>.from(json['subCategories'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subCategories': subCategories,
    };
  }
}
