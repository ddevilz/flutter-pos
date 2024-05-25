import 'package:flutter/material.dart';

class OrderItem {
  int? sno;
  int onum;
  DateTime? odate;
  String? otime;
  int? serial;
  String ino;
  String? iname;
  double? rate;
  double? quan;
  double? amount;
  String? notes;
  String? itype;
  int? cid;
  String? cname;
  String? mobile;
  DateTime? ddate;
  TimeOfDay? dtime1;
  String? dtime2;
  String? dtime3;
  String? company;

  OrderItem({
    this.sno,
    required this.onum,
    this.odate,
    this.otime,
    this.serial,
    required this.ino,
    this.iname,
    this.rate,
    this.quan,
    this.amount,
    this.notes,
    this.itype,
    this.cid,
    this.cname,
    this.mobile,
    this.ddate,
    this.dtime1,
    this.dtime2,
    this.dtime3,
    this.company,
  });

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        sno: json['sno'],
        onum: json['onum'],
        odate: json['odate'] != null ? DateTime.parse(json['odate']) : null,
        otime: json['otime'],
        serial: json['serial'],
        ino: json['ino'],
        iname: json['iname'],
        rate: json['rate'],
        quan: json['quan'],
        amount: json['amount'],
        notes: json['notes'],
        itype: json['itype'],
        cid: json['cid'],
        cname: json['cname'],
        mobile: json['mobile'],
        ddate: json['ddate'] != null ? DateTime.parse(json['ddate']) : null,
        dtime1: json['dtime1'] != null
            ? TimeOfDay(
                hour: DateTime.parse('2020-01-01 ' + json['dtime1']).hour,
                minute: DateTime.parse('2020-01-01 ' + json['dtime1']).minute)
            : null,
        dtime2: json['dtime2'],
        dtime3: json['dtime3'],
        company: json['company'],
      );

  Map<String, dynamic> toMap() => {
        'sno': sno,
        'onum': onum,
        'odate': odate?.toIso8601String(),
        'otime': otime,
        'serial': serial,
        'ino': ino,
        'iname': iname,
        'rate': rate,
        'quan': quan,
        'amount': amount,
        'notes': notes,
        'itype': itype,
        'cid': cid,
        'cname': cname,
        'mobile': mobile,
        'ddate': ddate?.toIso8601String(),
        'dtime1': dtime1 != null ? '${dtime1!.hour}:${dtime1!.minute}' : null,
        'dtime2': dtime2,
        'dtime3': dtime3,
        'company': company,
      };
}
