import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ukraine_invasion/bloc/data_bloc.dart';

import 'widgets/statistic.dart';

final GetIt getIt = GetIt.instance;

void main() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  getIt.registerLazySingleton<DataBloc>(() => DataBloc());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ukraine Invasion',
      theme: ThemeData.dark(),
      home: const PagesLayout(),
    );
  }
}

class PagesLayout extends StatefulWidget {
  const PagesLayout({Key? key}) : super(key: key);

  @override
  State<PagesLayout> createState() => _PagesLayoutState();
}

class _PagesLayoutState extends State<PagesLayout> {
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          Statistic(type: StatType.day),
          Statistic(type: StatType.total),
        ],
      ),
    );
  }
}

enum StatType { day, total }
