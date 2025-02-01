
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';


class NoConnectionHomeErrorLoading extends StatefulWidget {
  const NoConnectionHomeErrorLoading({super.key});

  @override
  State<NoConnectionHomeErrorLoading> createState() =>
      _NoConnectionHomeErrorLoadingState();
}

class _NoConnectionHomeErrorLoadingState
    extends State<NoConnectionHomeErrorLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.75, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Icon(
                  state is InternetConnected
                      ? Icons.wifi
                      : Icons.signal_wifi_off,
                  size: 100,
                  color: state is InternetConnected ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                state is InternetConnected
                    ? "You're online!"
                    : "No internet connection",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: state is InternetConnected ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
