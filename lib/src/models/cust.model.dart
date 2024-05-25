class Customer {
  int cid;
  String cname;
  String? mobile;
  String add1;
  String? rtype;
  double? dis;

  Customer({
    required this.cid,
    required this.cname,
    this.mobile,
    required this.add1,
    this.rtype,
    this.dis,
  });

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        cid: json['cid'],
        cname: json['cname'],
        mobile: json['mobile'],
        add1: json['add1'],
        rtype: json['rtype'],
        dis: json['dis'],
      );

  Map<String, dynamic> toMap() => {
        'cid': cid,
        'cname': cname,
        'mobile': mobile,
        'add1': add1,
        'rtype': rtype,
        'dis': dis,
      };
}

