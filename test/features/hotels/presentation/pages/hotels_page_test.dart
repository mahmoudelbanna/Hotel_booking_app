import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';

import '../../../../fixtures/test_mocks.mocks.dart';

void main() {
  late MockInternetCubit internetCubit;
  late MockFetchHotelsCubit fetchHotelsCubit;
  late MockFavoriteBloc favoriteBloc;
  late GetIt getItTest;

  setUp(() {
    getItTest = GetIt.instance;
    getItTest.reset();

    internetCubit = MockInternetCubit();
    fetchHotelsCubit = MockFetchHotelsCubit();
    favoriteBloc = MockFavoriteBloc();

    getItTest.registerFactory<InternetCubit>(() => internetCubit);
    getItTest.registerFactory<FetchHotelsCubit>(() => fetchHotelsCubit);
    getItTest.registerLazySingleton<FavoriteBloc>(() => favoriteBloc);

    when(fetchHotelsCubit.state).thenReturn(const FetchHotelsState.loading());
    when(favoriteBloc.state).thenReturn(FavoriteState.initial());

    when(
      fetchHotelsCubit.stream,
    ).thenAnswer((_) => Stream.value(const FetchHotelsState.loading()));
    when(
      favoriteBloc.stream,
    ).thenAnswer((_) => Stream.value(FavoriteState.initial()));

    when(fetchHotelsCubit.fetchHotels()).thenAnswer((_) async {});
  });

  setUpAll(() {
    provideDummy<FetchHotelsState>(const FetchHotelsState.loading());
    provideDummy<FavoriteState>(FavoriteState.initial());
  });

  tearDown(() {
    internetCubit.close();
    fetchHotelsCubit.close();
    favoriteBloc.close();
    getItTest.reset();
  });

  const keyLoadingInternetWidget = ValueKey(kLoadingInternetWidgetKey);

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => internetCubit),
        BlocProvider<FetchHotelsCubit>(create: (context) => fetchHotelsCubit),
        BlocProvider<FavoriteBloc>(create: (context) => favoriteBloc),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: HotelsPage()),
      ),
    );
  }

  group('HotelsPage Tests', () {
    testWidgets('shows HotelsPage when internet is connected', (
      WidgetTester tester,
    ) async {
      when(internetCubit.state).thenReturn(const InternetState.connected());
      when(
        internetCubit.stream,
      ).thenAnswer((_) => Stream.fromIterable([const InternetState.connected()]));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(HotelsView), findsOneWidget);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);
      expect(find.byKey(keyLoadingInternetWidget), findsNothing);
    });

    testWidgets(
      'shows NoConnectionHomeErrorLoading when internet is disconnected',
      (WidgetTester tester) async {
        when(internetCubit.state).thenReturn(const InternetState.disconnected());
        when(internetCubit.stream).thenAnswer(
          (_) => Stream.fromIterable([const InternetState.disconnected()]),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        // as there is repeat animation on NoConnectionHomeErrorLoading
        await tester.pump();

        expect(find.byType(NoConnectionHomeErrorLoading), findsOneWidget);
        expect(find.byType(HotelsView), findsNothing);
        expect(find.byType(LoadingWidget), findsNothing);
      },
    );

    testWidgets('shows LoadingWidget when internet is loading', (
      WidgetTester tester,
    ) async {
      when(internetCubit.state).thenReturn(const InternetState.loading());
      when(
        internetCubit.stream,
      ).thenAnswer((_) => Stream.fromIterable([const InternetState.loading()]));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byKey(keyLoadingInternetWidget), findsOneWidget);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);
      expect(find.byType(HotelsView), findsNothing);
    });

    testWidgets('updates UI when internet state changes', (
      WidgetTester tester,
    ) async {
      final streamController = StreamController<InternetState>.broadcast();

      when(internetCubit.stream).thenAnswer((_) => streamController.stream);
      when(internetCubit.state).thenReturn(InternetState.disconnected());

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(NoConnectionHomeErrorLoading), findsOneWidget);
      expect(find.byType(HotelsView), findsNothing);
      expect(find.byType(LoadingWidget), findsNothing);

      when(internetCubit.state).thenReturn(const InternetState.connected());
      streamController.add(const InternetState.connected());

      await tester.pump();

      expect(find.byType(HotelsView), findsOneWidget);
      expect(find.byKey(keyLoadingInternetWidget), findsNothing);
      expect(find.byType(NoConnectionHomeErrorLoading), findsNothing);

      await streamController.close();
    });
  });
}
