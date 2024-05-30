import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../data/repository.dart';
import '../model/enemy_losses.dart';

class DataBloc {
  DataBloc() {
    _getLosses();
  }

  final _losses = BehaviorSubject<EnemyLosses>();
  Stream<EnemyLosses> get losses => _losses.stream;
  Function(EnemyLosses) get changeLosses => _losses.sink.add;

  final _totalLosses = BehaviorSubject<EnemyLosses>();
  Stream<EnemyLosses> get totalLosses => _totalLosses.stream;
  Function(EnemyLosses) get changeTotalLosses => _totalLosses.sink.add;

  void _getLosses() {
    final repository = Repository();
    repository
        .getData()
        .then((value) => changeLosses(value))
        .onError((error, _) => debugPrint(error.toString()))
        .then((_) => repository.getTotalData())
        .then((value) => changeTotalLosses(value))
        .onError((error, _) => debugPrint(error.toString()));
  }

  dispose() {
    _losses.close();
    _totalLosses.close();
  }
}
