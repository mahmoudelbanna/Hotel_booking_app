import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/injection/injection.dart' as di;
import 'hotel_booking_app.dart';

/// Initializes the app by setting up the hydrated storage directory,
/// initializing the dependencies, setting up the bloc observer, and
/// running the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  di.init();
  Bloc.observer = const AppBlocObserver();

  runApp(
    const MyApp(),
  );
}
