// by default it's daily values
class EnemyLosses {
  final int tanks;
  final int apv;
  final int artillery;
  final int mlrs;
  final int aaws;
  final int aircraft;
  final int helicopters;
  final int uav;
  final int vehicles;
  final int boats;
  final int se;
  final int missiles;
  final int personnel;
  final int submarines;

  EnemyLosses({
    required this.tanks,
    required this.apv,
    required this.artillery,
    required this.mlrs,
    required this.aaws,
    required this.aircraft,
    required this.helicopters,
    required this.uav,
    required this.vehicles,
    required this.boats,
    required this.se,
    required this.missiles,
    required this.personnel,
    required this.submarines,
  });

  factory EnemyLosses.fromJson(Map<String, dynamic> json) {
    return EnemyLosses(
      tanks: json['tanks'] as int,
      apv: json['apv'] as int,
      artillery: json['artillery'] as int,
      mlrs: json['mlrs'] as int,
      aaws: json['aaws'] as int,
      aircraft: json['aircraft'] as int,
      helicopters: json['helicopters'] as int,
      uav: json['uav'] as int,
      vehicles: json['vehicles'] as int,
      boats: json['boats'] as int,
      se: json['se'] as int,
      missiles: json['missiles'] as int,
      personnel: json['personnel'] as int,
      submarines: json['submarines'] as int,
    );
  }

  @override
  String toString() {
    return 'Enemy Losses{tanks: $tanks, apv: $apv, artillery: $artillery, mlrs: $mlrs, aaws: $aaws, aircraft: $aircraft, helicopters: $helicopters, uav: $uav, vehicles: $vehicles, boats: $boats, se: $se, missiles: $missiles, personnel: $personnel}';
  }
}
