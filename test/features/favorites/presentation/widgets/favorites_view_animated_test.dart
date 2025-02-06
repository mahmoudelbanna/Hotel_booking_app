import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_favorite_hotel_data.dart';
import 'favorites_view_animated_test.mocks.dart';

// Update with correct import path
@GenerateMocks([FavoriteBloc, LanguageCubit, InternetCubit])
void main() {
  late MockFavoriteBloc favoriteBloc;
  late MockLanguageCubit languageCubit;
  late MockInternetCubit internetCubit;
  late StreamController<FavoriteState> blocController;

  late GetIt getItTest;

  setUp(() {
    getItTest = GetIt.instance;
    favoriteBloc = MockFavoriteBloc();
    languageCubit = MockLanguageCubit();
    internetCubit = MockInternetCubit();
    blocController = StreamController<FavoriteState>.broadcast();
    when(favoriteBloc.stream).thenAnswer((_) => blocController.stream);

    getItTest.registerLazySingleton<FavoriteBloc>(() => favoriteBloc);

    when(languageCubit.state)
        .thenReturn(LanguageState(languageCode: 'en', countryCode: 'US'));
    when(internetCubit.state).thenReturn(const InternetConnected());

    when(internetCubit.stream)
        .thenAnswer((_) => Stream.value(const InternetConnected()));
  });

  setUpAll(() {
    provideDummy<LanguageState>(
        LanguageState(languageCode: 'en', countryCode: 'US'));
  });

  tearDown(() {
    favoriteBloc.close();
    languageCubit.close();
    internetCubit.close();
    getItTest.reset();
    blocController.close();
  });

  final dynamicHotelA = TestFavoriteHotelData.favoriteHotelA;
  final dynamicHotelB = TestFavoriteHotelData.favoriteHotelB;

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => internetCubit,
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => languageCubit,
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => favoriteBloc,
        ),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: FavoritesViewAnimated(),
        ),
      ),
    );
  }

  group('FavoritesViewAnimated', () {
    testWidgets('renders empty list when no favorites are available',
        (WidgetTester tester) async {
      when(favoriteBloc.state).thenReturn(FavoriteState.initial());
      when(favoriteBloc.stream)
          .thenAnswer((_) => Stream.value(FavoriteState.initial()));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(EmptyListWidget), findsOneWidget);
      expect(find.byType(FavoriteHotelCard), findsNothing);
    });

    testWidgets('renders favorite hotels list when there are favorites',
        (WidgetTester tester) async {
      when(favoriteBloc.state).thenReturn(
        FavoriteState(
          favorites: {dynamicHotelA[kHotelId]: dynamicHotelA},
        ),
      );

      when(favoriteBloc.stream).thenAnswer(
        (_) => Stream.value(
          FavoriteState(
            favorites: {dynamicHotelA[kHotelId]: dynamicHotelA},
          ),
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump();

      expect(find.byType(FavoriteHotelCard), findsOneWidget);
      expect(find.byType(EmptyListWidget), findsNothing);
    });

    testWidgets('adds items to the list', (WidgetTester tester) async {
      favoriteBloc.add(ToggleFavorite(
        hotelId: dynamicHotelB[kHotelId],
        hotelData: dynamicHotelB,
      ));

      when(favoriteBloc.state).thenReturn(
        FavoriteState(
          favorites: {
            dynamicHotelA[kHotelId]: dynamicHotelA,
            dynamicHotelB[kHotelId]: dynamicHotelB,
          },
        ),
      );

      when(favoriteBloc.stream).thenAnswer(
        (_) => Stream.value(
          FavoriteState(
            favorites: {
              dynamicHotelA[kHotelId]: dynamicHotelA,
              dynamicHotelB[kHotelId]: dynamicHotelB,
            },
          ),
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump();

      expect(find.byType(FavoriteHotelCard), findsNWidgets(2));
    });
  });
  testWidgets('animates when removing a hotel from favorites',
      (WidgetTester tester) async {
    final blocController = StreamController<FavoriteState>.broadcast();

    when(favoriteBloc.state).thenReturn(
      FavoriteState(favorites: {
        dynamicHotelA[kHotelId]: dynamicHotelA,
        dynamicHotelB[kHotelId]: dynamicHotelB,
      }),
    );

    when(favoriteBloc.stream).thenAnswer((_) => blocController.stream);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Verify initial state
    expect(find.byType(FavoriteHotelCard), findsNWidgets(2));

    // Emit new state
    blocController.add(FavoriteState(favorites: {
      dynamicHotelA[kHotelId]: dynamicHotelA,
    }));

    // Wait for the animation to start
    await tester.pump();

    // Wait for the complete animation duration
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Now verify final state
    expect(find.byType(FavoriteHotelCard), findsOneWidget);

    await blocController.close();
  });
  testWidgets('animates when adding a hotel to favorites',
      (WidgetTester tester) async {
    final blocController = StreamController<FavoriteState>.broadcast();

    // Setup initial state
    when(favoriteBloc.state).thenReturn(
      FavoriteState(favorites: {
        dynamicHotelA[kHotelId]: dynamicHotelA,
      }),
    );

    when(favoriteBloc.stream).thenAnswer((_) => blocController.stream);

    // Build widget
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Verify initial state
    expect(find.byType(FavoriteHotelCard), findsOneWidget);

    // Emit new state
    blocController.add(FavoriteState(favorites: {
      dynamicHotelA[kHotelId]: dynamicHotelA,
      dynamicHotelB[kHotelId]: dynamicHotelB,
    }));

    // Wait for the animation to start
    await tester.pump();

    // Wait for the complete animation duration
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Now verify final state
    expect(find.byType(FavoriteHotelCard), findsNWidgets(2));

    await blocController.close();
  });
}
