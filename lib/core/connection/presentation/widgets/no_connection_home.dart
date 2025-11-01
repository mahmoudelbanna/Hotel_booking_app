import 'package:flutter/material.dart';

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
    _animation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: const Icon(
                Icons.signal_wifi_off,
                size: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              context.l10n.noInternetConnection,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
