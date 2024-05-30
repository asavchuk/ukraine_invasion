import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/enemy_losses.dart';

class Repository {
  late Map<String, dynamic> _cache;

  Future<EnemyLosses> getData() async {
    final httpDataUrl = Uri.parse('https://russian-casualties.in.ua/api/v1/data/json/daily');
    final response = await http.get(httpDataUrl);
    if (response.statusCode != 200) {
      throw 'Failed to retrieve the http data!';
    }
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    _cache = decoded['data'];

    var lastKey = _cache.keys.last;
    // debugPrint(lastKey);
    final losses = EnemyLosses.fromJson(_cache[lastKey]);
    // debugPrint(losses.toString());

    // lastKey = lastKey.replaceAll('.', '-');
    // final parseDt = DateTime.parse(lastKey);
    // final theDayAfter = parseDt.add(const Duration(days: 1, hours: 0, minutes: 0));
    // final date = DateFormat.yMMMEd().format(theDayAfter);
    // debugPrint(date); // Fri, Apr 3, 2020

    return losses;
  }

  EnemyLosses getTotalData() {
    int tanks = 0,
        apv = 0,
        artillery = 0,
        mlrs = 0,
        aaws = 0,
        aircraft = 0,
        helicopters = 0,
        uav = 0,
        vehicles = 0,
        boats = 0,
        se = 0,
        missiles = 0,
        personnel = 0,
        submarines = 0;

    _cache.forEach((_, v) {
      tanks = tanks + v['tanks'] as int;
      apv = apv + v['apv'] as int;
      artillery = artillery + v['artillery'] as int;
      mlrs = mlrs + v['mlrs'] as int;
      aaws = aaws + v['aaws'] as int;
      aircraft = aircraft + v['aircraft'] as int;
      helicopters = helicopters + v['helicopters'] as int;
      uav = uav + v['uav'] as int;
      vehicles = vehicles + v['vehicles'] as int;
      boats = boats + v['boats'] as int;
      se = se + v['se'] as int;
      missiles = missiles + v['missiles'] as int;
      personnel = personnel + v['personnel'] as int;
      submarines = submarines + v['submarines'] as int;
    });

    return EnemyLosses(
      tanks: tanks,
      apv: apv,
      artillery: artillery,
      mlrs: mlrs,
      aaws: aaws,
      aircraft: aircraft,
      helicopters: helicopters,
      uav: uav,
      vehicles: vehicles,
      boats: boats,
      se: se,
      missiles: missiles,
      personnel: personnel,
      submarines: submarines,
    );
  }
}
