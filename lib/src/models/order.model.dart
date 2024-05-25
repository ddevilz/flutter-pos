import 'package:flutter/material.dart';

class Order {
  int sno;
  int onum;
  DateTime odate;
  String otime;
  String rtype;
  int? cid;
  String? cname;
  String? mobile;
  int? items;
  double? quans;
  double? sub;
  double? disp;
  double? disamt;
  double? tax;
  double? gross;
  double? rof;
  double? net;
  double? ad;
  String? pby;
  double? bal;
  String dtype;
  double? nop;
  DateTime? ddate;
  TimeOfDay? dtime1;
  String? dtime2;
  String? dtime3;
  String? remarks;
  String status;
  String? company;
  double? cash;
  double? card;
  double? netb;
  double? others;
  double taxp;

  Order({
    required this.sno,
    required this.onum,
    required this.odate,
    required this.otime,
    required this.rtype,
    this.cid,
    this.cname,
    this.mobile,
    this.items,
    this.quans,
    this.sub,
    this.disp,
    this.disamt,
    this.tax,
    this.gross,
    this.rof,
    this.net,
    this.ad,
    this.pby,
    this.bal,
    required this.dtype,
    this.nop,
    this.ddate,
    this.dtime1,
    this.dtime2,
    this.dtime3,
    this.remarks,
    required this.status,
    this.company,
    this.cash,
    this.card,
    this.netb,
    this.others,
    required this.taxp,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        sno: json['sno'],
        onum: json['onum'],
        odate: DateTime.parse(json['odate']),
        otime: json['otime'],
        rtype: json['rtype'],
        cid: json['cid'],
        cname: json['cname'],
        mobile: json['mobile'],
        items: json['items'],
        quans: json['quans'],
        sub: json['sub'],
        disp: json['disp'],
        disamt: json['disamt'],
        tax: json['tax'],
        gross: json['gross'],
        rof: json['rof'],
        net: json['net'],
        ad: json['ad'],
        pby: json['pby'],
        bal: json['bal'],
        dtype: json['dtype'],
        nop: json['nop'],
        ddate: json['ddate'] != null ? DateTime.parse(json['ddate']) : null,
        dtime1: json['dtime1'] != null ? TimeOfDay(hour: int.parse(json['dtime1'].split(':')[0]), minute: int.parse(json['dtime1'].split(':')[1])) : null,
        dtime2: json['dtime2'],
        dtime3: json['dtime3'],
        remarks: json['remarks'],
        status: json['status'],
        company: json['company'],
        cash: json['cash'],
        card: json['card'],
        netb: json['netb'],
        others: json['others'],
        taxp: json['taxp'],
      );

  Map<String, dynamic> toMap() => {
        'sno': sno,
        'onum': onum,
        'odate': odate.toIso8601String(),
        'otime': otime,
        'rtype': rtype,
        'cid': cid,
        'cname': cname,
        'mobile': mobile,
        'items': items,
        'quans': quans,
        'sub': sub,
        'disp': disp,
        'disamt': disamt,
        'tax': tax,
        'gross': gross,
        'rof': rof,
        'net': net,
        'ad': ad,
        'pby': pby,
        'bal': bal,
        'dtype': dtype,
        'nop': nop,
        'ddate': ddate?.toIso8601String(),
        'dtime1': dtime1 != null ? '${dtime1!.hour}:${dtime1!.minute}' : null,
        'dtime2': dtime2,
        'dtime3': dtime3,
        'remarks': remarks,
        'status': status,
        'company': company,
        'cash': cash,
        'card': card,
        'netb': netb,
        'others': others,
        'taxp': taxp,
      };
}

