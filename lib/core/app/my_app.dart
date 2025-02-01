import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hotel_booking_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<InternetCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LanguageCubit>(),
        ),
      ],
      child: MyAppView(),
    );
  }
}
