class MasterProcess {
  String dtype;
  String status;
  int sno;

  MasterProcess({
    required this.dtype,
    required this.status,
    required this.sno,
  });

  factory MasterProcess.fromMap(Map<String, dynamic> json) => MasterProcess(
        dtype: json['dtype'],
        status: json['status'],
        sno: json['sno'],
      );

  Map<String, dynamic> toMap() => {
        'dtype': dtype,
        'status': status,
        'sno': sno,
      };
}

