import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../hotel_booking_app.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHotelsCubit, FetchHotelsState>(
      builder: (context, state) {
        if (state is FetchHotelsLoading) {
          return const LoadingWidget();
        } else if (state is FetchHotelsSuccess) {
          return HotelCardsList(hotels: state.hotels);
          
        } else if (state is FetchHotelsFailure) {
          return const ErrorFetchHotelsWidget();
        }

        return const EmptyListWidget();
      },
    );
  }
}
