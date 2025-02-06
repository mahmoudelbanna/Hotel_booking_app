import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfileImage(),
              ProfileElement(
                title: context.l10n.userProfile,
                leadingIcon: Icons.person,
              ),
              ProfileElement(
                title: context.l10n.language,
                leadingIcon: Icons.language,
                onTap: () {
                  context.router.push(const LanguageRoute());
                },
              ),
              ProfileElement(
                title: context.l10n.logout,
                leadingIcon: Icons.logout,
              ),
              ProfileElement(
                title: context.l10n.deleteAccount,
                leadingIcon: Icons.delete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
