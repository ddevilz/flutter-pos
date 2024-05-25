class Category {
  String category;
  String catid;

  Category({
    required this.category,
    required this.catid,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        category: json['category'],
        catid: json['catid'],
      );

  Map<String, dynamic> toMap() => {
        'category': category,
        'catid': catid,
      };
}

