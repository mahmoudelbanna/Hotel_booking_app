import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.indigo.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ab in den Urlaub!',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Button(
                    onPressed: () => context.tabsRouter.setActiveIndex(1),
                    text: context.l10n.exploreHotels,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
