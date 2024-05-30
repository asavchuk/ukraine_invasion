import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/data_bloc.dart';
import '../main.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key, required this.type});
  final StatType type;

  @override
  Widget build(BuildContext context) {
    final bloc = getIt.get<DataBloc>();
    final textStyle = GoogleFonts.economica(fontSize: 22);
    if (type == StatType.day) {
      debugPrint('day page');
    } else {
      debugPrint('total page');
    }
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/background.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        StreamBuilder(
          stream: type == StatType.day ? bloc.losses : bloc.totalLosses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Wrap the ListView widget in a Positioned.fill widget to make it fill the entire screen
              return Positioned.fill(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(fontSize: 28, letterSpacing: 0.5),
                        'Ukraine Invasion',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        textAlign: TextAlign.center,
                        style: textStyle,
                        type == StatType.day
                            ? 'Enemy combat losses over the past 24 hours were approximately:'
                            : 'Total enemy combat losses for the entire invasion since February 24, 2022 were approximately:',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Personnel:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.cyan.shade200),
                        '${snapshot.data!.personnel}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        // textAlign: TextAlign.center,
                        style: textStyle,
                        'Tanks:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.tanks}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Armoured Personnel Vehicles:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.apv}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Artillery Systems:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.artillery}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Multiple Launch Rocket Systems:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.mlrs}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Anti-Aircraft Warfare Systems:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.aaws}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Aircraft:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.aircraft}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Helicopters:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.helicopters}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Cruise Missiles:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.missiles}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Drones:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.uav}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Vehicles and fuel tanks:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.vehicles}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Boats:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.boats}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Special Equipment:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.se}',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        style: textStyle,
                        'Submarines:',
                      ),
                      trailing: Text(
                        style: textStyle.copyWith(fontWeight: FontWeight.bold),
                        '${snapshot.data!.submarines}',
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
