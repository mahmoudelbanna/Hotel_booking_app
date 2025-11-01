import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FetchHotelsCubit>().state;
    return state.when(
      loading: () => const LoadingWidget(),
      success: (hotels) => HotelCardsList(hotels: hotels),
      failure: (message) => ErrorFetchHotelsWidget(message: message),
    );
  }
}
