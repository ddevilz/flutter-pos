class ItemMaster {
  int ino;
  String iname;
  double rate1;
  double rate2;
  double rate3;
  double rate4;
  double rate5;
  String itype;

  ItemMaster({
    required this.ino,
    required this.iname,
    required this.rate1,
    required this.rate2,
    required this.rate3,
    required this.rate4,
    required this.rate5,
    required this.itype,
  });

  factory ItemMaster.fromMap(Map<String, dynamic> json) => ItemMaster(
        ino: json['ino'],
        iname: json['iname'],
        rate1: json['rate1'],
        rate2: json['rate2'],
        rate3: json['rate3'],
        rate4: json['rate4'],
        rate5: json['rate5'],
        itype: json['itype'],
      );

  Map<String, dynamic> toMap() => {
        'ino': ino,
        'iname': iname,
        'rate1': rate1,
        'rate2': rate2,
        'rate3': rate3,
        'rate4': rate4,
        'rate5': rate5,
        'itype': itype,
      };
}

