import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/stats/stats_bloc.dart';
import 'bloc/timer/timer_bloc.dart';
import 'bloc/wheel/wheel_bloc.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StatsBloc()..add(GetStats())),
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => WheelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'w600',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xff1f021f),
          dialogBackgroundColor: const Color(0xff2a222b),
          dialogTheme: const DialogTheme(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
