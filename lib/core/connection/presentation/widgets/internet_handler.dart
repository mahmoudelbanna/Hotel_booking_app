import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';
// Adjust the import as necessary

class InternetStateHandler extends StatelessWidget {
  const InternetStateHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state.when(
          loading:
              () => const LoadingWidget(
                key: ValueKey(kLoadingInternetWidgetKey), // for testing
              ),
          connected: () => child,
          disconnected: () => const NoConnectionHomeErrorLoading(),
        );
      },
    );
  }
}
