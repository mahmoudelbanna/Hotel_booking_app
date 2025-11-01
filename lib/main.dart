import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/injection/injection.dart' as di;
import 'hotel_booking_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } on Exception catch (e) {
    if (kDebugMode) {
      debugPrint('Failed to load .env file: $e');
    }
  }

  try {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    );
  } on Exception catch (e) {
    if (kDebugMode) {
      debugPrint('Failed to initialize HydratedBloc storage: $e');
    }
  }

  di.init();
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}
