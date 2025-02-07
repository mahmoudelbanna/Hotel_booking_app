import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_hotel_data.dart';
import 'hotel_view_test.mocks.dart';

@GenerateMocks([FetchHotelsCubit, FavoriteBloc])
void main() {
  late MockFetchHotelsCubit fetchHotelsCubit;
  late MockFavoriteBloc favoriteBloc;
  late GetIt getItTest;

  setUp(() {
    getItTest = GetIt.instance;
    getItTest.reset();

    fetchHotelsCubit = MockFetchHotelsCubit();
    favoriteBloc = MockFavoriteBloc();

    getItTest.registerFactory<FetchHotelsCubit>(() => fetchHotelsCubit);
    getItTest.registerLazySingleton<FavoriteBloc>(() => favoriteBloc);

    when(favoriteBloc.state).thenReturn(FavoriteState.initial());

    when(favoriteBloc.stream)
        .thenAnswer((_) => Stream.value(FavoriteState.initial()));
  });

  setUpAll(() {
    provideDummy<FetchHotelsState>(const FetchHotelsLoading());
    provideDummy<FavoriteState>(FavoriteState.initial());
  });

  tearDown(() {
    fetchHotelsCubit.close();
    favoriteBloc.close();
    getItTest.reset();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchHotelsCubit>(
          create: (context) => fetchHotelsCubit,
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => favoriteBloc,
        ),
      ],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: HotelsView(),
        ),
      ),
    );
  }

  testWidgets('displays LoadingWidget when in FetchHotelsLoading state',
      (WidgetTester tester) async {
    when(fetchHotelsCubit.state).thenReturn(
      const FetchHotelsLoading(),
    );
    when(fetchHotelsCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const FetchHotelsLoading(),
      ]),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LoadingWidget), findsOneWidget);
    expect(find.byType(HotelCardsList), findsNothing);
    expect(find.byType(ErrorFetchHotelsWidget), findsNothing);
    expect(find.byType(EmptyListWidget), findsNothing);
  });

  testWidgets('displays HotelCardsList when in FetchHotelsSuccess state',
      (WidgetTester tester) async {
    final hotels = [TestHotelData.hotel];

    when(fetchHotelsCubit.state).thenReturn(
      FetchHotelsSuccess(hotels: hotels),
    );
    when(fetchHotelsCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        FetchHotelsSuccess(hotels: hotels),
      ]),
    );
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(HotelCardsList), findsOneWidget);
    expect(find.text(hotels[0].name), findsOneWidget);
  });

  testWidgets(
      'displays ErrorFetchHotelsWidget when in FetchHotelsFailure state',
      (WidgetTester tester) async {
    when(fetchHotelsCubit.state).thenReturn(
      const FetchHotelsFailure(),
    );
    when(fetchHotelsCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const FetchHotelsFailure(),
      ]),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ErrorFetchHotelsWidget), findsOneWidget);
    expect(find.byType(HotelCardsList), findsNothing);
    expect(find.byType(LoadingWidget), findsNothing);
    expect(find.byType(EmptyListWidget), findsNothing);
  });
}
