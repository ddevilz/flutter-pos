class ItemTax {
  double taxp;

  ItemTax({
    required this.taxp,
  });

  factory ItemTax.fromMap(Map<String, dynamic> json) => ItemTax(
        taxp: json['taxp'],
      );

  Map<String, dynamic> toMap() => {
        'taxp': taxp,
      };
}

