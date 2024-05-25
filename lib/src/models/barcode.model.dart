class Barcode {
  String cat;
  String onum;
  String sno;

  Barcode({
    required this.cat,
    required this.onum,
    required this.sno,
  });

  factory Barcode.fromMap(Map<String, dynamic> json) => Barcode(
        cat: json['cat'],
        onum: json['onum'],
        sno: json['sno'],
      );

  Map<String, dynamic> toMap() => {
        'cat': cat,
        'onum': onum,
        'sno': sno,
      };
}

