import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

import 'package:mockito/mockito.dart';

import '../../../../fixtures/fake_app_router.dart';
import '../../../../fixtures/test_mocks.mocks.dart';

void main() {
  late FakeAppRouter fakeAppRouter;
  late MockFavoriteBloc favoriteBloc;
  late MockLanguageCubit languageCubit;
  late MockInternetCubit internetCubit;
  late MockFetchHotelsCubit fetchHotelsCubit;
  late GetIt getItTest;

  setUp(() {
    fakeAppRouter = FakeAppRouter();
    getItTest = GetIt.instance;
    favoriteBloc = MockFavoriteBloc();
    languageCubit = MockLanguageCubit();
    internetCubit = MockInternetCubit();
    fetchHotelsCubit = MockFetchHotelsCubit();
    getItTest.registerLazySingleton<FavoriteBloc>(() => favoriteBloc);
    getItTest.registerFactory<FetchHotelsCubit>(() => fetchHotelsCubit);

    when(favoriteBloc.state).thenReturn(FavoriteState.initial());
    when(
      languageCubit.state,
    ).thenReturn(LanguageState(languageCode: 'en', countryCode: 'US'));
    when(internetCubit.state).thenReturn(const InternetState.connected());
    when(fetchHotelsCubit.state).thenReturn(const FetchHotelsState.loading());
    when(
      favoriteBloc.stream,
    ).thenAnswer((_) => Stream.value(FavoriteState.initial()));
    when(
      internetCubit.stream,
    ).thenAnswer((_) => Stream.value(const InternetState.connected()));
    when(
      fetchHotelsCubit.stream,
    ).thenAnswer((_) => Stream.value(const FetchHotelsState.loading()));
  });

  setUpAll(() {
    provideDummy<FavoriteState>(FavoriteState.initial());
    provideDummy<LanguageState>(
      LanguageState(languageCode: 'en', countryCode: 'US'),
    );
    provideDummy<FetchHotelsState>(const FetchHotelsState.loading());
  });

  tearDown(() {
    favoriteBloc.close();
    languageCubit.close();
    fetchHotelsCubit.close();
    internetCubit.close();
    getItTest.reset();
  });

  Future<void> pumpRouterConfigApp(WidgetTester tester) {
    return tester
        .pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<FavoriteBloc>(create: (context) => favoriteBloc),
              BlocProvider<LanguageCubit>(create: (context) => languageCubit),
              BlocProvider<InternetCubit>(create: (context) => internetCubit),
              BlocProvider<FetchHotelsCubit>(
                create: (context) => fetchHotelsCubit,
              ),
            ],
            child: MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: fakeAppRouter.config(),
            ),
          ),
        )
        .then((_) => tester.pumpAndSettle());
  }

  testWidgets('OverviewPage displays text ', (WidgetTester tester) async {
    await pumpRouterConfigApp(tester);

    fakeAppRouter.push(const OverviewRoute());
    await tester.pumpAndSettle();

    expect(find.text('Ab in den Urlaub!'), findsOneWidget);
  });
  testWidgets('OverviewPage navigates to HotelsRoute on button tap', (
    WidgetTester tester,
  ) async {
    await pumpRouterConfigApp(tester);

    final exploreHotelsButton = find.text(
      AppLocalizations.of(tester.element(find.byType(Button)))!.exploreHotels,
    );
    expect(exploreHotelsButton, findsOneWidget);

    await tester.tap(exploreHotelsButton);

    await tester.pump();

    expect(fakeAppRouter.topRoute.name, HotelsRoute.name);
  });
}
