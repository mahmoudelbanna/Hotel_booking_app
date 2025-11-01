import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class ErrorFetchHotelsWidget extends StatefulWidget {
  const ErrorFetchHotelsWidget({this.message, super.key});

  final String? message;

  @override
  State<ErrorFetchHotelsWidget> createState() => _ErrorFetchHotelsWidgetState();
}

class _ErrorFetchHotelsWidgetState extends State<ErrorFetchHotelsWidget>
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          ScaleTransition(
            scale: _animation,
            child: const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.message ?? context.l10n.somethingWentWrong,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Button(
            onPressed: () {
              context.read<FetchHotelsCubit>().fetchHotels();
            },
            text: context.l10n.retry,
          ),
        ],
      ),
    );
  }
}
