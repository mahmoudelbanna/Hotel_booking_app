import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

@RoutePage()
class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FetchHotelsCubit>()..fetchHotels(),
        ),
        BlocProvider.value(
          value: getIt<FavoriteBloc>(),
        ),
      ],
      child: const HotelsView(),
    );
  }
}
